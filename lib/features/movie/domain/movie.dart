import 'package:flixio_app/features/genre/domain/genre.dart';
import 'package:flixio_app/features/movie/data/movie_entity.dart';
import 'package:flutter/foundation.dart';

@immutable
class Movie {
  final String title;
  final String overview;
  final num voteAverage;
  final List<Genre> genres;
  final String releaseDate;
  final String? backdropPath;
  final String? posterPath;

  const Movie({
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.genres,
    required this.releaseDate,
    this.backdropPath,
    this.posterPath,
  });

  Movie.initial()
      : title = '',
        overview = '',
        genres = [],
        releaseDate = '',
        backdropPath = '',
        posterPath = '',
        voteAverage = 0;

  factory Movie.fromEntity(MovieEntity entity, List<Genre> genres) {
    return Movie(
      title: entity.title,
      overview: entity.overview,
      voteAverage: entity.voteAverage,
      genres: genres
          .where((genre) => entity.genreIds.contains(genre.id))
          .toList(growable: false),
      releaseDate: entity.releaseDate,
      backdropPath:
          'https://image.tmdb.org/t/p/original/${entity.backdropPath}',
      posterPath: 'https://image.tmdb.org/t/p/original/${entity.posterPath}',
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Movie &&
            other.title == title &&
            other.overview == overview &&
            other.voteAverage == voteAverage &&
            other.genres == genres &&
            other.releaseDate == releaseDate &&
            other.backdropPath == backdropPath &&
            other.posterPath == posterPath;
  }

  @override
  int get hashCode => Object.hash(title, overview, voteAverage, genres,
      releaseDate, backdropPath, posterPath);
}
