import 'package:flixio_app/features/genre/domain/genre.dart';
import 'package:flixio_app/features/movie/application/movie_service.dart';
import 'package:flixio_app/features/movie/domain/movie.dart';
import 'package:flixio_app/features/movie/domain/movie_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieControllerProvider =
    StateNotifierProvider<MovieController, MovieState>((ref) {
  return MovieController(
      MovieState(
          genres: const AsyncValue.data([]),
          movie: AsyncValue.data(Movie.initial())),
      ref.watch(movieServiceProvider));
});

class MovieController extends StateNotifier<MovieState> {
  MovieController(MovieState state, this._movieService) : super(state) {
    loadGenres();
  }

  final MovieService _movieService;

// Load Genres on the Screen
  Future<void> loadGenres() async {
    state = state.copyWith(genres: const AsyncValue.loading());
    final result = await _movieService.getGenres();
    final updatedGenres = AsyncValue.data(result);
    state = state.copyWith(genres: updatedGenres);
  }

  // Get Movie
  Future<void> getRecommendedMovie() async {
    state = state.copyWith(movie: const AsyncValue.loading());
    final selectedGenres = state.genres.asData!.value
        .where((e) => e.isSelected == true)
        .toList(growable: false);
    final result =
        await _movieService.getRecommendMovies(state.rating, selectedGenres);
    try {
      state = state.copyWith(movie: AsyncValue.data(result));
    } catch (e) {
      rethrow;
    }
  }

  // Select the genres
  void toggleSelected(Genre genre) {
    state = state.copyWith(
        genres: AsyncValue.data([
      for (final oldGenre in state.genres.asData!.value)
        if (oldGenre == genre) oldGenre.toggleSelected() else oldGenre
    ]));
  }

  void updateRating(int updateRating) {
    state = state.copyWith(rating: updateRating < 0 ? 0 : updateRating);
  }
}
