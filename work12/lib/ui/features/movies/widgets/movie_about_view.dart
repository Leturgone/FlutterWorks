import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/models/movie.dart';

class MovieAboutView extends StatelessWidget {
  final Movie movie;

  const MovieAboutView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CachedNetworkImage(
              imageUrl: movie.image,
              width: 200,
              height: 300,
              fit: BoxFit.cover,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(height: 16),
          Text(
            movie.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.movie, size: 16),
              SizedBox(width: 4),
              Text('Режиссер: ${movie.director}'),
              Spacer(),
              Icon(Icons.calendar_today, size: 16),
              SizedBox(width: 4),
              Text('Год: ${movie.year}'),
            ],
          ),
          SizedBox(height: 16),
          Text(
            movie.description ?? 'Нет описания',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}