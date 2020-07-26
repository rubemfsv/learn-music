import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

class CategoryStore = _CategoryStore with _$CategoryStore;

abstract class _CategoryStore with Store {
  _CategoryStore({ObservableList<Category> categories})
      : categories = categories ?? ObservableList<Category>();

  final ObservableList<Category> categories;

  @observable
  ObservableFuture<void> loader;

  uReactionDisposer _disposeSaveReaction;

  @computed
  List<Category> get visibleCategories => categories.toList(growable: false);

  @action
  Future<void> _loadCategories() async {
    final entities = [
      Category(),
      Category(),
    ];

    categories.addAll(entities.toList());
  }

  Future<void> init() async {
    loader = ObservableFuture(_loadCategories());

    await loader;
  }
}
