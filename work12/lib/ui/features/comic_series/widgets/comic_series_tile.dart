import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:work12/core/models/comic_series.dart';

class ComicSeriesTile extends StatelessWidget {
  final ComicSeries series;
  final ValueChanged<ComicSeries> onTap;

  const ComicSeriesTile({
    super.key,
    required this.series,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      label: series.title,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: ListTile(
          onTap: () => onTap(series),
          leading: CachedNetworkImage(
            imageUrl: series.image,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          title: Text(
            series.title,
          ),
        ),
      ),
    );
  }
}