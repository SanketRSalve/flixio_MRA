import 'package:flutter/foundation.dart';

@immutable
class GenreEntity {
  final String name;
  final int id;

  const GenreEntity({
    required this.name,
    required this.id,
  });

  factory GenreEntity.fromMap(Map<String, dynamic> map) {
    return GenreEntity(name: map['name'], id: map['id']);
  }

  @override
  String toString() => "GenreEntity(name: $name, id: $id)";

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is GenreEntity && other.name == name && other.id == id;
  }

  @override
  int get hashCode => Object.hash(name, id);
}
