// Mocks generated by Mockito 5.0.11 from annotations
// in moviedb/test/screens/movie_screen_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:mockito/mockito.dart' as _i1;
import 'package:moviedb/core/models/async_state.dart' as _i2;
import 'package:moviedb/core/models/movie_detail.dart' as _i3;
import 'package:moviedb/core/services/movie_service.dart' as _i8;
import 'package:moviedb/core/models/movie_cast.dart' as _i9;
import 'package:moviedb/core/models/movie_trailer.dart' as _i10;
import 'package:moviedb/core/models/movie.dart' as _i11;
import 'package:moviedb/movie/widgets/popular/popular_movies_view_model.dart'
    as _i7;
import 'package:moviedb/movie/widgets/upcoming/upcoming_movies_view_model.dart'
    as _i4;
import 'package:state_notifier/state_notifier.dart' as _i5;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeAsyncState<T> extends _i1.Fake implements _i2.AsyncState<T> {}

class _FakeMovieDetail extends _i1.Fake implements _i3.MovieDetail {}

class _FakeMovieCast extends _i1.Fake implements _i9.MovieCast {}

class _FakeMovieTrailer extends _i1.Fake implements _i10.MovieTrailer {}


/// A class which mocks [UpcomingMoviesViewModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpcomingMoviesViewModel extends _i1.Mock
    implements _i4.UpcomingMoviesViewModel {
  MockUpcomingMoviesViewModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set onError(_i5.ErrorListener? _onError) =>
      super.noSuchMethod(Invocation.setter(#onError, _onError),
          returnValueForMissingStub: null);
  @override
  bool get mounted =>
      (super.noSuchMethod(Invocation.getter(#mounted), returnValue: false)
          as bool);
  @override
  // _i6.Stream<_i2.AsyncState<List<_i3.MovieDetail>>> get stream =>
  //     (super.noSuchMethod(Invocation.getter(#stream),
  //             returnValue: Stream<_i2.AsyncState<List<_i3.MovieDetail>>>.empty())
  //         as _i6.Stream<_i2.AsyncState<List<_i3.MovieDetail>>>);
  _i6.Stream<_i2.AsyncState<List<_i11.Movie>>> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
          returnValue: Stream<_i2.AsyncState<List<_i11.Movie>>>.empty())
      as _i6.Stream<_i2.AsyncState<List<_i11.Movie>>>);
  @override
  _i2.AsyncState<List<_i11.Movie>> get state =>
      (super.noSuchMethod(Invocation.getter(#state),
              returnValue: _FakeAsyncState<List<_i11.Movie>>())
          as _i2.AsyncState<List<_i11.Movie>>);
  @override
  set state(_i2.AsyncState<List<_i11.Movie>>? value) =>
      super.noSuchMethod(Invocation.setter(#state, value),
          returnValueForMissingStub: null);
  @override
  _i2.AsyncState<List<_i11.Movie>> get debugState =>
      (super.noSuchMethod(Invocation.getter(#debugState),
              returnValue: _FakeAsyncState<List<_i11.Movie>>())
          as _i2.AsyncState<List<_i11.Movie>>);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  void loadData() => super.noSuchMethod(Invocation.method(#loadData, []),
      returnValueForMissingStub: null);
  @override
  _i5.RemoveListener addListener(
          _i5.Listener<_i2.AsyncState<List<_i11.Movie>>>? listener,
          {bool? fireImmediately = true}) =>
      (super.noSuchMethod(
          Invocation.method(
              #addListener, [listener], {#fireImmediately: fireImmediately}),
          returnValue: () {}) as _i5.RemoveListener);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
}

/// A class which mocks [PopularMoviesViewModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockPopularMoviesViewModel extends _i1.Mock
    implements _i7.PopularMoviesViewModel {
  MockPopularMoviesViewModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set onError(_i5.ErrorListener? _onError) =>
      super.noSuchMethod(Invocation.setter(#onError, _onError),
          returnValueForMissingStub: null);
  @override
  bool get mounted =>
      (super.noSuchMethod(Invocation.getter(#mounted), returnValue: false)
          as bool);
  @override
  _i6.Stream<_i2.AsyncState<List<_i11.Movie>>> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
              returnValue: Stream<_i2.AsyncState<List<_i11.Movie>>>.empty())
          as _i6.Stream<_i2.AsyncState<List<_i11.Movie>>>);
  @override
  _i2.AsyncState<List<_i11.Movie>> get state =>
      (super.noSuchMethod(Invocation.getter(#state),
              returnValue: _FakeAsyncState<List<_i11.Movie>>())
          as _i2.AsyncState<List<_i11.Movie>>);
  @override
  set state(_i2.AsyncState<List<_i11.Movie>>? value) =>
      super.noSuchMethod(Invocation.setter(#state, value),
          returnValueForMissingStub: null);
  @override
  _i2.AsyncState<List<_i11.Movie>> get debugState =>
      (super.noSuchMethod(Invocation.getter(#debugState),
              returnValue: _FakeAsyncState<List<_i11.Movie>>())
          as _i2.AsyncState<List<_i11.Movie>>);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  _i5.RemoveListener addListener(
          _i5.Listener<_i2.AsyncState<List<_i11.Movie>>>? listener,
          {bool? fireImmediately = true}) =>
      (super.noSuchMethod(
          Invocation.method(
              #addListener, [listener], {#fireImmediately: fireImmediately}),
          returnValue: () {}) as _i5.RemoveListener);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
}

/// A class which mocks [MovieService].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieService extends _i1.Mock implements _i8.MovieService {
  MockMovieService() {
    _i1.throwOnMissingStub(this);
  }
  @override
  _i6.Future<List<_i11.Movie>> getPopularMovie(int? page) =>
      (super.noSuchMethod(Invocation.method(#getPopularMovie, [page]),
              returnValue: Future<List<_i11.Movie>>.value(<_i11.Movie>[]))
          as _i6.Future<List<_i11.Movie>>);
  @override
  _i6.Future<List<_i11.Movie>> getUpcoming(int? page, int? pageSize) =>
      (super.noSuchMethod(Invocation.method(#getUpcoming, [page, pageSize]),
              returnValue: Future<List<_i11.Movie>>.value(<_i11.Movie>[]))
          as _i6.Future<List<_i11.Movie>>);
  @override
  _i6.Future<_i3.MovieDetail> getMovieDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieDetails, [id]),
              returnValue: Future<_i3.MovieDetail>.value(_FakeMovieDetail()))
          as _i6.Future<_i3.MovieDetail>);

  @override
  _i6.Future<List<_i9.MovieCast>> getMovieCast(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieCast, [id]),
              returnValue: Future<List<_i9.MovieCast>>.value(([])))
          as _i6.Future<List<_i9.MovieCast>>);
  @override
  _i6.Future<_i10.MovieTrailer> getMovieTrailer(
      int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieTrailer, [id]),
              returnValue: Future<_i10.MovieTrailer>.value(_FakeMovieTrailer()))
          as _i6.Future<_i10.MovieTrailer>);
}
