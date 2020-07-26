import 'package:mobx/mobx.dart';
import 'package:learntech/models/quest_category.dart';

part 'quest_category_store.g.dart';

class QuestCategoryStore = _QuestCategoryStore with _$QuestCategoryStore;

abstract class _QuestCategoryStore with Store {
  _QuestCategoryStore({ObservableList<QuestCategory> categories})
      : categories = categories ?? ObservableList<QuestCategory>();

  final ObservableList<QuestCategory> categories;
  ReactionDisposer _disposeSaveReaction;

  @observable
  ObservableFuture<void> loader;

@computed
  List<QuestCategory> get allCategories => categories.toList(growable: false);

  @action
  Future<void> _loadCategories() async {
    final entities = [
      QuestCategory(description: "Database"),
      QuestCategory(description: "JS"),
      QuestCategory(description: "Dart"),
      QuestCategory(description: "Ruby")
    ];

    categories.addAll(entities.toList());
  }

  Future<void> init() async {
    loader = ObservableFuture(_loadCategories());

    await loader;
  }
}

enum VisibilityFilter { all, pending, completed }
