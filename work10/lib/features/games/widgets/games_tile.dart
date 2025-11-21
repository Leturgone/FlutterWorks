import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/game.dart';

class GameTile extends StatelessWidget {
  final Game game;
  final ValueChanged<Game> onTap;

  const GameTile({
    super.key,
    required this.game,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        onTap: () => onTap(game),
        leading: CachedNetworkImage(
          imageUrl: game.image,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        title: Text(game.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(game.developer),
            Text(game.platform),
          ],
        ),
      ),
    );
  }
}