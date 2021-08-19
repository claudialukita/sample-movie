import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:moviedb/core/models/async_state.dart';
import 'package:moviedb/core/models/movie_detail.dart';
import 'package:moviedb/core/providers/storage_provider.dart';
import 'package:moviedb/core/services/movie_service.dart';

final movieDetailViewModelProvider =
    StateNotifierProvider<MovieDetailViewModel, AsyncState<MovieDetail>>(
        (ref) => MovieDetailViewModel(ref.read(movieServiceProvider), ref.read(storageProvider)));

class MovieDetailViewModel extends StateNotifier<AsyncState<MovieDetail>> {
  final MovieService _movieService;
  final FlutterSecureStorage _secureStorage;
  MovieDetailViewModel(this._movieService, this._secureStorage) : super(Initial(null));

  loadData(int movieId) async {
    state = Loading(state.data);
    try {
      var movies = await _movieService.getMovieDetail(movieId);
      print(movies);
      state = Success(movies);
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }
  //cek ada di secure storage atau ngga, if ada likenya on

  // addToFavorite(int movieId) async {
  //   //array of string
  //   //json
  //   //read secure storage
  //   //if not null
  //   //parse array of string
  //   //add id baru
  //   //write
  //   //if null
  //   //langsung write
  //   state = Loading(state.data);
  //   try {
  //     var movies = await _movieService.setFavoritedMovie(favoriteMovieList);
  //     print(movies);
  //     state = Success(movies);
  //   } catch (exception) {
  //     state = Error('Something went wrong', state.data);
  //   }
  // }

  //getFavoriteList
  
}
