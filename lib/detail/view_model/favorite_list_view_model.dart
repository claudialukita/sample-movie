import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/core/models/async_state.dart';
import 'package:moviedb/core/models/movie_detail.dart';
import 'package:moviedb/core/services/movie_service.dart';

final favoriteListViewModelProvider =
StateNotifierProvider<MovieDetailViewModel, AsyncState<List<MovieDetail>>>(
        (ref) => MovieDetailViewModel(ref.read(movieServiceProvider)));

class MovieDetailViewModel extends StateNotifier<AsyncState<List<MovieDetail>>> {
  final MovieService _movieService;
  MovieDetailViewModel(this._movieService) : super(Initial(null));

  loadData() async {
    state = Loading(state.data);
    try {
      var idFavoriteMovie = await _movieService.getAllFavoriteMovie();
      var favoriteMovie = await _movieService.getFavoriteMovieDetail(idFavoriteMovie);
      print(favoriteMovie);
      state = new Success(favoriteMovie);
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }

}
