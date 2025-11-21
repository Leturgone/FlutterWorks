// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_gallery_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ComicSeriesListStore on _ComicGalleryStore, Store {
  late final _$coverListAtom = Atom(
    name: '_ComicGalleryStore.coverList',
    context: context,
  );

  @override
  ObservableList<String> get coverList {
    _$coverListAtom.reportRead();
    return super.coverList;
  }

  @override
  set coverList(ObservableList<String> value) {
    _$coverListAtom.reportWrite(value, super.coverList, () {
      super.coverList = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_ComicGalleryStore.isLoading',
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
    '_ComicGalleryStore.loadSeries',
    context: context,
  );

  @override
  Future<void> loadSeries() {
    return _$loadSeriesAsyncAction.run(() => super.loadSeries());
  }

  @override
  String toString() {
    return '''
coverList: ${coverList},
isLoading: ${isLoading}
    ''';
  }
}
