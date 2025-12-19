// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_series_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ComicSeriesListStore on _ComicSeriesListStore, Store {
  late final _$seriesListAtom = Atom(
    name: '_ComicSeriesListStore.seriesList',
    context: context,
  );

  @override
  ObservableList<ComicSeries> get seriesList {
    _$seriesListAtom.reportRead();
    return super.seriesList;
  }

  @override
  set seriesList(ObservableList<ComicSeries> value) {
    _$seriesListAtom.reportWrite(value, super.seriesList, () {
      super.seriesList = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_ComicSeriesListStore.isLoading',
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
    '_ComicSeriesListStore.loadSeries',
    context: context,
  );

  @override
  Future<void> loadSeries() {
    return _$loadSeriesAsyncAction.run(() => super.loadSeries());
  }

  @override
  String toString() {
    return '''
seriesList: ${seriesList},
isLoading: ${isLoading}
    ''';
  }
}
