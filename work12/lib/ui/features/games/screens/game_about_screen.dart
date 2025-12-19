import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import '../stores/game_about_store.dart';
import '../widgets/game_about_view.dart';

class GameAboutScreen extends StatelessWidget {
  final GameAboutStore store = GameAboutStore();
  final int gameId;

  GameAboutScreen({super.key, required this.gameId}) {
    store.loadGame(gameId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Об игре'),
      ),
      body: Observer(
        builder: (_) {
          if (store.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          final game = store.game;
          if (game == null) {
            return Center(child: Text('Нет данных'));
          }
          return GameAboutView(game: game);
        },
      ),
    );
  }
}