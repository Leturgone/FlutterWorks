import 'package:flutter/material.dart';
import 'package:work12/core/models/comic_series.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ComicSeriesAboutView extends StatelessWidget {
  final ComicSeries series;

  const ComicSeriesAboutView({super.key, required this.series});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Center(
            child: CachedNetworkImage(
              imageUrl: series.image,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(height: 16),
          Text(
            series.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person, size: 16),
              SizedBox(width: 4),
              Text('Автор: ${series.writer}'),
            ],
          ),
          SizedBox(height: 16),
          Text(
            series.description ?? 'Нет описания',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}