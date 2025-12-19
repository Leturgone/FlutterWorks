import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/models/news.dart';

class NewsTile extends StatelessWidget {
  final News news;
  final ValueChanged<News> onTap;

  const NewsTile({
    super.key,
    required this.news,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        onTap: () => onTap(news),
        leading: CachedNetworkImage(
          imageUrl: news.image,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        title: Text(news.title),
        subtitle: Text('${news.date.day}.${news.date.month}.${news.date.year} - ${news.author}'),
      ),
    );
  }
}