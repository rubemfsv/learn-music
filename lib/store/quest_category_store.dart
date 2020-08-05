import 'package:mobx/mobx.dart';
import 'package:learntech/models/quest_category.dart';

part 'quest_category_store.g.dart';

class QuestCategoryStore = _QuestCategoryStore with _$QuestCategoryStore;

abstract class _QuestCategoryStore with Store {
  _QuestCategoryStore({
    ObservableList<QuestCategory> categories,
    this.filter = VisibilityFilter.all,
    }) : categories = categories ?? ObservableList<QuestCategory>();

  final ObservableList<QuestCategory> categories;
  ReactionDisposer _disposeSaveReaction;

  @observable
  VisibilityFilter filter;

  @observable
  ObservableFuture<void> loader;

  @computed
  List<QuestCategory> get allCategories => categories.toList(growable: false);

  @action
  Future<void> _loadCategories() async {
    final entities = [
      QuestCategory(description: "Fundamentos da Teoria Musical"),
      QuestCategory(description: "Desenvolvendo a Musicalidade"),
      QuestCategory(
          description:
              "Musicalidade: Gráficos de acordes, acordes diatônicos e teclas secundárias"),
      QuestCategory(
          description:
              "Musicalidade: Tensões, Função Harmônica e Intercâmbio Modal"),
      QuestCategory(description: "Fundamentos de Piano"),
      QuestCategory(description: "Fundamentos de Baixo"),
      QuestCategory(description: "Fundamentos de Violão"),
      QuestCategory(description: "Fundamentos de Percussão")
    ];

    categories.addAll(entities.toList());
  }

  Future<void> init() async {
    loader = ObservableFuture(_loadCategories());

    await loader;
  }
}

enum VisibilityFilter { all, pending, completed }
