import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

part 'category_store.g.dart';

class Category = _Category with _$Category;

abstract class _Category with Store {
  _Category({String id, this.description = ''})
      : id = id ?? Uuid().generateV4();

  final String id;

  @observable
  String description;

  @override
  String toString() {
    return '_Category{id: $id, description: $description}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _Category &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          description == other.description;

  @override
  int get hashCode => id.hashCode ^ description.hashCode;
}
