import 'package:flutter/material.dart';

import '../../../core/models/movie.dart';
import 'movies_tile.dart';


class MovieListView extends StatelessWidget {
  final List<Movie> movieList;
  final ValueChanged<Movie> onMovieTap;

  const MovieListView({
    super.key,
    required this.movieList,
    required this.onMovieTap,
  });

  @override
  Widget build(BuildContext context) {
    if (movieList.isEmpty) {
      return const Center(
        child: Text(
          'Список фильмов пуст',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: movieList.length,
      itemBuilder: (context, index) {
        final movie = movieList[index];
        return MovieTile(
          key: ValueKey(movie.id),
          movie: movie,
          onTap: onMovieTap,
        );
      },
    );
  }
}