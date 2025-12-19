import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';

import '../stores/movie_about_store.dart';
import '../widgets/movie_about_view.dart';

class MovieAboutScreen extends StatelessWidget {
  final MovieAboutStore store = MovieAboutStore();
  final int movieId;

  MovieAboutScreen({super.key, required this.movieId}) {
    store.loadMovie(movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('О фильме'),
      ),
      body: Observer(
        builder: (_) {
          if (store.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          final movie = store.movie;
          if (movie == null) {
            return Center(child: Text('Нет данных'));
          }
          return MovieAboutView(movie: movie);
        },
      ),
    );
  }
}