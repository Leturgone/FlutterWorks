// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_series_about_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ComicSeriesAboutStore on _ComicSeriesAboutStore, Store {
  late final _$seriesAtom = Atom(
    name: '_ComicSeriesAboutStore.series',
    context: context,
  );

  @override
  ComicSeries? get series {
    _$seriesAtom.reportRead();
    return super.series;
  }

  @override
  set series(ComicSeries? value) {
    _$seriesAtom.reportWrite(value, super.series, () {
      super.series = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_ComicSeriesAboutStore.isLoading',
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

  late final _$loadSeriesAsyncAction = AsyncAction(
    '_ComicSeriesAboutStore.loadSeries',
    context: context,
  );

  @override
  Future<dynamic> loadSeries(int seriesId) {
    return _$loadSeriesAsyncAction.run(() => super.loadSeries(seriesId));
  }

  @override
  String toString() {
    return '''
series: ${series},
isLoading: ${isLoading}
    ''';
  }
}
