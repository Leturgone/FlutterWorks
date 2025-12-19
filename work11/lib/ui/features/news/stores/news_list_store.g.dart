// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewsListStore on _NewsListStore, Store {
  late final _$newsListAtom = Atom(
    name: '_NewsListStore.newsList',
    context: context,
  );

  @override
  ObservableList<News> get newsList {
    _$newsListAtom.reportRead();
    return super.newsList;
  }

  @override
  set newsList(ObservableList<News> value) {
    _$newsListAtom.reportWrite(value, super.newsList, () {
      super.newsList = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_NewsListStore.isLoading',
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

  late final _$loadNewsAsyncAction = AsyncAction(
    '_NewsListStore.loadNews',
    context: context,
  );

  @override
  Future<void> loadNews() {
    return _$loadNewsAsyncAction.run(() => super.loadNews());
  }

  @override
  String toString() {
    return '''
newsList: ${newsList},
isLoading: ${isLoading}
    ''';
  }
}
