import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:moviedb/core/models/async_state.dart';
import 'package:moviedb/core/models/favorite_movie.dart';
import 'package:moviedb/core/providers/storage_provider.dart';
import 'package:moviedb/core/services/movie_service.dart';

final favoritedMovieViewModelProvider =
StateNotifierProvider<FavoritedMovieViewModel, AsyncState<List<FavoriteMovie>>>(
        (ref) => FavoritedMovieViewModel(ref.read(storageProvider)));

class FavoritedMovieViewModel extends StateNotifier<AsyncState<List<FavoriteMovie>>> {
  final MovieService _movieService;
  final FlutterSecureStorage _secureStorage;
  FavoritedMovieViewModel(this._secureStorage) : super(Initial<List<FavoriteMovie>>([]));

  addToFavorite(int movieId) async {
    state = Loading(state.data);
    try {
      var movies = await _movieService.setFavoritedMovie(favoriteMovieList);
      print(movies);
      // state = Success(movies);
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }
}
