import 'dart:math';

import 'package:flixio_app/features/genre/domain/genre.dart';

import 'package:flixio_app/features/movie/data/movie_repo.dart';
import 'package:flixio_app/features/movie/domain/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieServiceProvider = Provider<MovieService>((ref) {
  final movieRepo = ref.watch(movieRepoProvider);
  return TMDBMovieService(movieRepo);
});

abstract class MovieService {
  Future<List<Genre>> getGenres();
  Future<Movie> getRecommendMovies(int rating, List<Genre> genres);
}

class TMDBMovieService implements MovieService {
  TMDBMovieService(this._movieRepository);
  final MovieRepo _movieRepository;

  @override
  Future<List<Genre>> getGenres() async {
    try {
      final genreEntities = await _movieRepository.getMovieGenres();
      final genres = genreEntities.map((e) => Genre.fromEntity(e)).toList();

      return genres;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Movie> getRecommendMovies(int rating, List<Genre> genres) async {
    final genreIds = genres.map((e) => e.id).toList().join(',');

    try {
      final movieEntities = await _movieRepository.getRecommendMovies(
          rating.toDouble(), genreIds);
      final movies =
          movieEntities.map((e) => Movie.fromEntity(e, genres)).toList();
      final rnd = Random();
      final randomMovie = movies[rnd.nextInt(movies.length)];

      return randomMovie;
    } catch (e) {
      rethrow;
    }
  }
}
