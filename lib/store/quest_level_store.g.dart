// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest_level_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QuestLevelStore on _QuestLevelStore, Store {
  Computed<List<QuestLevel>> _$allLevelsComputed;

  @override
  List<QuestLevel> get allLevels =>
      (_$allLevelsComputed ??= Computed<List<QuestLevel>>(() => super.allLevels,
              name: '_QuestLevelStore.allLevels'))
          .value;
  Computed<QuestLevel> _$basicLevelComputed;

  @override
  QuestLevel get basicLevel =>
      (_$basicLevelComputed ??= Computed<QuestLevel>(() => super.basicLevel,
              name: '_QuestLevelStore.basicLevel'))
          .value;

  final _$filterAtom = Atom(name: '_QuestLevelStore.filter');

  @override
  VisibilityFilter get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(VisibilityFilter value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$loaderAtom = Atom(name: '_QuestLevelStore.loader');

  @override
  ObservableFuture<void> get loader {
    _$loaderAtom.reportRead();
    return super.loader;
  }

  @override
  set loader(ObservableFuture<void> value) {
    _$loaderAtom.reportWrite(value, super.loader, () {
      super.loader = value;
    });
  }

  final _$_loadLevelsAsyncAction = AsyncAction('_QuestLevelStore._loadLevels');

  @override
  Future<void> _loadLevels(QuestCategory category) {
    return _$_loadLevelsAsyncAction.run(() => super._loadLevels(category));
  }

  @override
  String toString() {
    return '''
filter: ${filter},
loader: ${loader},
allLevels: ${allLevels},
basicLevel: ${basicLevel}
    ''';
  }
}
