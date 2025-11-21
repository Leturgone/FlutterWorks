import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';

import '../models/game.dart';
import '../stores/games_list_store.dart';
import '../widgets/games_list_view.dart';
import 'game_about_screen.dart';

class GameListScreen extends StatelessWidget {
  final GameListStore store = GameListStore();
  final bool usual;
  final Function(String selectedImage)? onSelectImage;

  GameListScreen({super.key, required this.usual, this.onSelectImage}) {
    store.loadGames();
  }

  void onGameTap(BuildContext context, Game game) {
    if (usual) {
      context.push('/game-about', extra: game.id);
    } else {
      if (onSelectImage != null) {
        onSelectImage!(game.image);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Игры'),
      ),
      body: Observer(
        builder: (_) {
          if (store.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (store.gameList.isEmpty) {
            return Center(child: Text('Нет данных'));
          }
          return GameListView(
            gameList: store.gameList,
            onGameTap: (game) => onGameTap(context, game),
          );
        },
      ),
    );
  }
}