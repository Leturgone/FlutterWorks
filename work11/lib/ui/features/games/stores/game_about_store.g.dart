// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_about_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GameAboutStore on _GameAboutStore, Store {
  late final _$gameAtom = Atom(name: '_GameAboutStore.game', context: context);

  @override
  Game? get game {
    _$gameAtom.reportRead();
    return super.game;
  }

  @override
  set game(Game? value) {
    _$gameAtom.reportWrite(value, super.game, () {
      super.game = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_GameAboutStore.isLoading',
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

  late final _$loadGameAsyncAction = AsyncAction(
    '_GameAboutStore.loadGame',
    context: context,
  );

  @override
  Future<dynamic> loadGame(int gameId) {
    return _$loadGameAsyncAction.run(() => super.loadGame(gameId));
  }

  @override
  String toString() {
    return '''
game: ${game},
isLoading: ${isLoading}
    ''';
  }
}
