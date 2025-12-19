import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/models/game.dart';



class GameAboutView extends StatelessWidget {
  final Game game;

  const GameAboutView({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child:
          CachedNetworkImage(
            imageUrl: game.image,
            width: 150,
            height: 200,
            fit: BoxFit.cover,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          )),
          SizedBox(height: 16),
          Text(
            game.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.developer_mode, size: 16),
              SizedBox(width: 4),
              Text('Разработчик: ${game.developer}'),
            ],
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.computer, size: 16),
              SizedBox(width: 4),
              Text('Платформа: ${game.platform}'),
            ],
          ),
          SizedBox(height: 16),
          Text(
            game.description ?? 'Нет описания',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
