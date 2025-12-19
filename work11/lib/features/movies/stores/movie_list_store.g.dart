// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieListStore on _MovieListStore, Store {
  late final _$movieListAtom = Atom(
    name: '_MovieListStore.movieList',
    context: context,
  );

  @override
  ObservableList<Movie> get movieList {
    _$movieListAtom.reportRead();
    return super.movieList;
  }

  @override
  set movieList(ObservableList<Movie> value) {
    _$movieListAtom.reportWrite(value, super.movieList, () {
      super.movieList = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_MovieListStore.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$loadMoviesAsyncAction = AsyncAction(
    '_MovieListStore.loadMovies',
    context: context,
  );

  @override
  Future<void> loadMovies() {
    return _$loadMoviesAsyncAction.run(() => super.loadMovies());
  }

  @override
  String toString() {
    return '''
movieList: ${movieList},
isLoading: ${isLoading}
    ''';
  }
}
