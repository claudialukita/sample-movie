import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/core/common/constants.dart';
import 'package:moviedb/core/models/movie.dart';
import 'package:moviedb/core/models/movie_detail.dart';
import 'package:moviedb/core/providers/dio_provider.dart';

final movieServiceProvider =
    Provider((ref) => MovieService(ref.read(dioProvider)));

class MovieService {
  final Dio _dio;

  MovieService(this._dio);

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

  Future<List<MovieDetail>> getMovieDetail(int movieId) async {
    List<MovieDetail> movies = [];

    var response = await _dio.get(
        '${API_URL}movie/${movieId}?api_key=${API_KEY}&append_to_response=videos,images');
    Map<int, dynamic> dataGenre = Map.fromIterable(response.data['genres'],
        key: (e) => response.data['genres'].indexOf(e),
        value: (e) => e["name"]);
    print(response.data.length);
    print(response.data['vote_count']);
    if (response.data.length > 0) {
      MovieDetail newMovieDetail = new MovieDetail(
        response.data['id'],
        response.data['title'],
        8.1,
        2050,
        // response.data['vote_count'],
        // double.parse(response.data['vote_average']),
        // double.parse(response.data['vote_count']),
        // response.data['poster_path'],
        'https://www.themoviedb.org/t/p/w780${response.data['poster_path']}',
        'https://www.themoviedb.org/t/p/w780${response.data['backdrop_path']}',
        dataGenre,
        response.data['overview'],
      );
      movies.add(newMovieDetail);
      print("Dapet respon ini nih");
      print(movies);
      // if (movies.length == pageSize) {
      //   break;
      // }
    }

    return movies;
  }
}
