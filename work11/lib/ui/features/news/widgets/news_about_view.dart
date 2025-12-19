import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/models/news.dart';

class NewsAboutView extends StatelessWidget {
  final News news;

  const NewsAboutView({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: news.image,
            width: 500,
            height: 200,
            fit: BoxFit.cover,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(height: 16),
          Text(
            news.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.person, size: 16),
              SizedBox(width: 4),
              Text('Автор: ${news.author}'),
              Spacer(),
              Icon(Icons.calendar_today, size: 16),
              SizedBox(width: 4),
              Text('${news.date.day}.${news.date.month}.${news.date.year}'),
            ],
          ),
          SizedBox(height: 16),
          Text(
            news.description ?? 'Нет описания',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}