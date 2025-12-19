import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/models/game.dart';
import 'games_tile.dart';

class GameListView extends StatelessWidget {
  final List<Game> gameList;
  final ValueChanged<Game> onGameTap;

  const GameListView({
    super.key,
    required this.gameList,
    required this.onGameTap,
  });

  @override
  Widget build(BuildContext context) {
    if (gameList.isEmpty) {
      return const Center(
        child: Text(
          'Список игр пуст',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: gameList.length,
      itemBuilder: (context, index) {
        final game = gameList[index];
        return GameTile(
          key: ValueKey(game.id),
          game: game,
          onTap: onGameTap,
        );
      },
    );
  }
}