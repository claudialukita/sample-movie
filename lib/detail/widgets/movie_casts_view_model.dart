import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/core/models/async_state.dart';
import 'package:moviedb/core/models/movie_cast.dart';
import 'package:moviedb/core/services/movie_service.dart';

final movieCastViewModelProvider =
StateNotifierProvider<MovieCastDetailViewModel, AsyncState<List<MovieCast>>>(
        (ref) => MovieCastDetailViewModel(ref.read(movieServiceProvider)));

class MovieCastDetailViewModel extends StateNotifier<AsyncState<List<MovieCast>>> {
  final MovieService _movieService;
  MovieCastDetailViewModel(this._movieService) : super(Initial<List<MovieCast>>([]));

  loadData(int movieId) async {
    state = Loading(state.data);
    try {
      var movieCast = await _movieService.getMovieCast(movieId);
      state = Success(movieCast);
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }
}
