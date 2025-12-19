
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/models/movie.dart';

class MovieTile extends StatelessWidget {
  final Movie movie;
  final ValueChanged<Movie> onTap;

  const MovieTile({
    super.key,
    required this.movie,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        onTap: () => onTap(movie),
        leading: CachedNetworkImage(
          imageUrl: movie.image,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        title: Text(movie.title),
        subtitle: Text('${movie.year} - ${movie.director}'),
      ),
    );
  }
}