// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_about_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewsAboutStore on _NewsAboutStore, Store {
  late final _$newsAtom = Atom(name: '_NewsAboutStore.news', context: context);

  @override
  News? get news {
    _$newsAtom.reportRead();
    return super.news;
  }

  @override
  set news(News? value) {
    _$newsAtom.reportWrite(value, super.news, () {
      super.news = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_NewsAboutStore.isLoading',
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
    '_NewsAboutStore.loadNews',
    context: context,
  );

  @override
  Future<dynamic> loadNews(int newsId) {
    return _$loadNewsAsyncAction.run(() => super.loadNews(newsId));
  }

  @override
  String toString() {
    return '''
news: ${news},
isLoading: ${isLoading}
    ''';
  }
}
