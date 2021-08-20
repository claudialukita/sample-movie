import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:moviedb/core/providers/storage_provider.dart';
import 'package:moviedb/core/services/movie_service.dart';

final favoritedMovieViewModelProvider =
StateNotifierProvider<FavoritedMovieViewModel, bool>(
        (ref) => FavoritedMovieViewModel(ref.read(movieServiceProvider), ref.read(storageProvider)));

class FavoritedMovieViewModel extends StateNotifier<bool> {
  final MovieService _movieService;
  final FlutterSecureStorage _secureStorage;
  FavoritedMovieViewModel(this._movieService, this._secureStorage) : super(false);

  getFavorite(int movieId) async{
    List<dynamic> favoriteMovieList = [];
    Map<String, dynamic> favMovieInList = await _secureStorage.readAll();
    favoriteMovieList = favMovieInList.values.toList();
    if(favoriteMovieList.contains(movieId)){
      state = true;
    } else {
      state = false;
    }
  }

  addToFavorite(int movieId) async {
    List<dynamic> favoriteMovieList = [];
    Map<String, dynamic> favMovieInList = await _secureStorage.readAll();
    print(favMovieInList);
    if(favMovieInList.isNotEmpty){
      favoriteMovieList = (json.decode(favMovieInList['favoriteMovie']) as List).map((item) => item as dynamic).toList();
      if(favoriteMovieList.contains(movieId)){
        favoriteMovieList.remove(movieId);
        await _movieService.removeFavoritedMovie(favoriteMovieList);
        state = false;
      } else {
        favoriteMovieList.add(movieId);
        await _movieService.setFavoritedMovie(favoriteMovieList);
        state = true;
      }
    } else {
      favoriteMovieList.add(movieId);
      await _movieService.setFavoritedMovie(favoriteMovieList);
      state = true;
    }
    }
}
