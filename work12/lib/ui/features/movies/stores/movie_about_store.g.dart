// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_about_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieAboutStore on _MovieAboutStore, Store {
  late final _$movieAtom = Atom(
    name: '_MovieAboutStore.movie',
    context: context,
  );

  @override
  Movie? get movie {
    _$movieAtom.reportRead();
    return super.movie;
  }

  @override
  set movie(Movie? value) {
    _$movieAtom.reportWrite(value, super.movie, () {
      super.movie = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_MovieAboutStore.isLoading',
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

  late final _$loadMovieAsyncAction = AsyncAction(
    '_MovieAboutStore.loadMovie',
    context: context,
  );

  @override
  Future<dynamic> loadMovie(int movieId) {
    return _$loadMovieAsyncAction.run(() => super.loadMovie(movieId));
  }

  @override
  String toString() {
    return '''
movie: ${movie},
isLoading: ${isLoading}
    ''';
  }
}
