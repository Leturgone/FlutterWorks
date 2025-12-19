// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'games_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GameListStore on _GameListStore, Store {
  late final _$gameListAtom = Atom(
    name: '_GameListStore.gameList',
    context: context,
  );

  @override
  ObservableList<Game> get gameList {
    _$gameListAtom.reportRead();
    return super.gameList;
  }

  @override
  set gameList(ObservableList<Game> value) {
    _$gameListAtom.reportWrite(value, super.gameList, () {
      super.gameList = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_GameListStore.isLoading',
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

  late final _$loadGamesAsyncAction = AsyncAction(
    '_GameListStore.loadGames',
    context: context,
  );

  @override
  Future<void> loadGames() {
    return _$loadGamesAsyncAction.run(() => super.loadGames());
  }

  @override
  String toString() {
    return '''
gameList: ${gameList},
isLoading: ${isLoading}
    ''';
  }
}
