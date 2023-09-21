import 'package:flixio_app/features/genre/data/genre_entity.dart';
import 'package:flutter/foundation.dart';

@immutable
class Genre {
  final String name;
  final int id;
  final bool isSelected;

  const Genre({
    required this.name,
    this.id = 0,
    this.isSelected = false,
  });

  factory Genre.fromEntity(GenreEntity entity) {
    return Genre(name: entity.name, id: entity.id, isSelected: false);
  }

  @override
  String toString() => "Genre(name: $name, id: $id, isSelected: $isSelected)";

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Genre &&
            other.name == name &&
            other.id == id &&
            other.isSelected == isSelected;
  }

  @override
  int get hashCode => Object.hash(name, id, isSelected);

  Genre toggleSelected() {
    return Genre(name: name, id: id, isSelected: !isSelected);
  }
}
