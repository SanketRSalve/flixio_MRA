import 'package:flixio_app/features/genre/domain/genre.dart';
import 'package:flixio_app/features/movie/domain/movie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class MovieState {
  final AsyncValue<List<Genre>> genres;
  final int rating;
  final AsyncValue<Movie> movie;

  const MovieState(
      {required this.genres, this.rating = 5, required this.movie});

  MovieState copyWith({
    AsyncValue<List<Genre>>? genres,
    int? rating,
    AsyncValue<Movie>? movie,
  }) {
    return MovieState(
      genres: genres ?? this.genres,
      rating: rating ?? this.rating,
      movie: movie ?? this.movie,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is MovieState && other.genres == genres && other.rating == rating;
  }

  @override
  int get hashCode => genres.hashCode ^ rating.hashCode;
}
