import 'package:flutter/foundation.dart';

@immutable
class MovieEntity {
  final String title;
  final String overview;
  final num voteAverage;
  final List<int> genreIds;
  final String releaseDate;
  final String? backdropPath;
  final String? posterPath;

  const MovieEntity({
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.genreIds,
    required this.releaseDate,
    this.backdropPath,
    this.posterPath,
  });

  factory MovieEntity.fromMap(Map<String, dynamic> map) {
    return MovieEntity(
        title: map['title'],
        overview: map['overview'],
        voteAverage: map['vote_average'],
        genreIds: List.from(map['genre_ids']),
        releaseDate: map['release_date'],
        backdropPath: map['backdrop_path'],
        posterPath: map['poster_path']);
  }

  @override
  String toString() =>
      'MovieEntity(title: $title, overview: $overview, voteAverage: $voteAverage, genres: $genreIds, releaseDate: $releaseDate, backdropPath: $backdropPath, posterPath: $posterPath)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is MovieEntity &&
            other.title == title &&
            other.overview == overview &&
            other.voteAverage == voteAverage &&
            other.genreIds == genreIds &&
            other.releaseDate == releaseDate &&
            other.backdropPath == backdropPath &&
            other.posterPath == posterPath;
  }

  @override
  int get hashCode => Object.hash(title, overview, voteAverage, genreIds,
      releaseDate, backdropPath, posterPath);
}
