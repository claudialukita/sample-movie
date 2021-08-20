import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/core/models/async_state.dart';
import 'package:moviedb/core/models/movie_trailer.dart';
import 'package:moviedb/core/services/movie_service.dart';

final movieTrailerViewModelProvider =
StateNotifierProvider<MovieTrailerViewModel, AsyncState<MovieTrailer>>(
        (ref) => MovieTrailerViewModel(ref.read(movieServiceProvider)));

class MovieTrailerViewModel extends StateNotifier<AsyncState<MovieTrailer>> {
  final MovieService _movieService;
  MovieTrailerViewModel(this._movieService) : super(Initial(null));

  loadData(int movieId) async {
    state = Loading(state.data);
    try {
      var movieTrailer = await _movieService.getMovieTrailer(movieId);
      print(movieTrailer);
      state = Success(movieTrailer);
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }

}
