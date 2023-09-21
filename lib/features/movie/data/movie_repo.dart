import 'package:dio/dio.dart';
import 'package:flixio_app/constants.dart';
import 'package:flixio_app/features/genre/data/genre_entity.dart';
import 'package:flixio_app/features/movie/data/movie_entity.dart';
import 'package:flixio_app/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepoProvider = Provider<MovieRepo>((ref) {
  final dio = ref.watch(dioProvider);
  return TMDBMovieRepository(dio: dio);
});

abstract class MovieRepo {
  Future<List<GenreEntity>> getMovieGenres();
  Future<List<MovieEntity>> getRecommendMovies(double rating, String genreIds);
}

class TMDBMovieRepository implements MovieRepo {
  final Dio dio;
  TMDBMovieRepository({required this.dio});
  @override
  Future<List<GenreEntity>> getMovieGenres() async {
    try {
      final response = await dio.get('genre/movie/list', queryParameters: {
        'api_key': api,
        'language': 'en-US',
      });

      final results = List<Map<String, dynamic>>.from(response.data['genres']);
      final genres = results.map((e) => GenreEntity.fromMap(e)).toList();

      return genres;
    } on DioException catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<MovieEntity>> getRecommendMovies(
      double rating, String genreIds) async {
    final response = await dio.get('discover/movie', queryParameters: {
      'api_key': api,
      'language': 'en-US',
      'sort_by': 'popularity.desc',
      'include_adult': false,
      'vote_average.gte': rating,
      'page': 1,
      'with_genre': genreIds,
    });
    final results = List<Map<String, dynamic>>.from(response.data['results']);
    final movies = results.map((e) => MovieEntity.fromMap(e)).toList();

    return movies;
  }
}
