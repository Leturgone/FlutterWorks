import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeaturesView extends StatelessWidget {
  const FeaturesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.book),
                iconSize: 50,
                onPressed: () {context.push('/comic_series');},
              ),
              Text('Серии комиксов')
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.movie),
                iconSize: 50,
                onPressed: () {context.push('/movies');},
              ),
              Text('Фильмы')
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.videogame_asset),
                iconSize: 50,
                onPressed: () {context.push('/games');},
              ),
              Text('Игры')
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.newspaper),
                iconSize: 50,
                onPressed: () {context.push('/news');},
              ),
              Text('Новости')
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.note),
                iconSize: 50,
                onPressed: () {context.push('/im_notes');},
              ),
              Text('Заметки о впечатлениях')
            ],
          ),
        ],
      ),
    );
  }
}