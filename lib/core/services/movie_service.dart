import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:moviedb/core/common/constants.dart';
import 'package:moviedb/core/models/favorite_movie.dart';
import 'package:moviedb/core/models/movie.dart';
import 'package:moviedb/core/models/movie_cast.dart';
import 'package:moviedb/core/models/movie_detail.dart';
import 'package:moviedb/core/providers/dio_provider.dart';
import 'package:moviedb/core/providers/storage_provider.dart';

final movieServiceProvider =
    Provider((ref) => MovieService(ref.read(dioProvider), ref.read(storageProvider)));

class MovieService {
  final Dio _dio;
  final FlutterSecureStorage _storageProvider;

  MovieService(this._dio, this._storageProvider);

  Future<List<Movie>> getPopularMovie(int page) async {
    List<Movie> movies = [];
    var response = await _dio.get(
        '${API_URL}discover/movie?api_key=${API_KEY}&language=en-US&sort_by=popularity.desc&include_adult=true&include_video=false&page=1&with_watch_monetization_types=flatrate');

    if (response.data.length > 0) {
      if (response.data['results'].length > 0) {
        for (var movieRes in response.data['results']) {
          Movie newMovie = new Movie(
            movieRes['id'],
            movieRes['title'],
            double.parse(movieRes['vote_average'].toString()),
            'https://www.themoviedb.org/t/p/w300${movieRes['poster_path']}',
            'https://www.themoviedb.org/t/p/w780${movieRes['backdrop_path']}',
          );
          movies.add(newMovie);
        }
      }
    }

    return movies;
  }

  Future<List<Movie>> getUpcoming(int page, int pageSize) async {
    List<Movie> movies = [];
    var response = await _dio.get(
        '${API_URL}movie/upcoming?api_key=${API_KEY}&language=en-US&page=1');

    if (response.data.length > 0) {
      if (response.data['results'].length > 0) {
        for (var movieRes in response.data['results']) {
          Movie newMovie = new Movie(
              movieRes['id'],
              movieRes['title'],
              double.parse(movieRes['vote_average'].toString()),
              'https://www.themoviedb.org/t/p/w300${movieRes['poster_path']}',
              'https://www.themoviedb.org/t/p/w780${movieRes['backdrop_path']}');
          movies.add(newMovie);
          if (movies.length == pageSize) {
            break;
          }
        }
      }
    }

    return movies;
  }

  Future<MovieDetail> getMovieDetail(int movieId) async {
    MovieDetail newMovieDetail;

    var response = await _dio.get(
        '${API_URL}movie/${movieId}?api_key=${API_KEY}&append_to_response=videos,images');
    Map<int, dynamic> dataGenre = Map.fromIterable(response.data['genres'],
        key: (e) => response.data['genres'].indexOf(e),
        value: (e) => e["name"]);
    print("coba: open movie detail");
    print(response.data['vote_average'].runtimeType);
    print(response.data['vote_count'].runtimeType);
    print("coba: close movie detail");

    if (response.data.length > 0) {
      MovieDetail newMovieDetail = new MovieDetail(
        response.data['id'],
        response.data['title'],
        response.data['vote_average'],
        response.data['vote_count'],
        'https://www.themoviedb.org/t/p/w780${response.data['poster_path']}',
        'https://www.themoviedb.org/t/p/w780${response.data['backdrop_path']}',
        dataGenre,
        response.data['overview'],
      );
      // movies.add(newMovieDetail);
      print("Dapet respon ini nih");
      print(newMovieDetail);
      // if (movies.length == pageSize) {
      //   break;
      // }
      return newMovieDetail;

    } else {
      throw Exception('Movie not found.');
    }

  }

  Future<List<MovieCast>> getMovieCast(int movieId) async {
    List<MovieCast> movieCasts = [];

    var response = await _dio.get(
        '${API_URL}movie/${movieId}/credits?api_key=${API_KEY}&language=en-US');
    //https://api.themoviedb.org/3/movie/{movie_id}/credits?api_key=<<api_key>>&language=en-US
    print(response.data['id']);
    print(response.data['cast'][0]['name']);
    print(response.data['cast'][0]['original_name']);
    print(response.data['cast'][0]['profile_path']);
    if (response.data.length > 0) {
      MovieCast newMovieCast = new MovieCast(
        response.data['id'],
        response.data['cast'],
      );
      movieCasts.add(newMovieCast);
      print("Dapet respon ini nih");
      print(movieCasts);
      // if (movieCasts.length == pageSize) {
      //   break;
      // }
    }

    return movieCasts;
  }

  Future setFavoritedMovie(int movieId) async {
    // String temp = json.encode(favoriteMovieList.toJson());
    String strMovieId = movieId.toString();
    // FavoriteMovie tempFavoriteMovieList = FavoriteMovie.fromJson(json.decode(temp));
    await _storageProvider.write(key: 'trykey', value: strMovieId);
    var response = await _storageProvider.read(key: 'trykey');
    print(response.runtimeType);
  }
}
