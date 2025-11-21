import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';

import '../models/movie.dart';
import '../stores/movie_list_store.dart';
import '../widgets/movies_list_view.dart';
import 'movie_about_screen.dart';

class MovieListScreen extends StatelessWidget {
  final MovieListStore store = MovieListStore();
  final bool usual;
  final Function(String selectedImage)? onSelectImage;

  MovieListScreen({super.key, required this.usual, this.onSelectImage}) {
    store.loadMovies();
  }

  void onMovieTap(BuildContext context, Movie movie) {
    if (usual) {
      context.push('/movie-about', extra: movie.id);
    } else {
      if (onSelectImage != null) {
        onSelectImage!(movie.image);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Фильмы'),
      ),
      body: Observer(
        builder: (_) {
          if (store.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (store.movieList.isEmpty) {
            return Center(child: Text('Нет данных'));
          }
          return MovieListView(
            movieList: store.movieList,
            onMovieTap: (movie) => onMovieTap(context, movie),
          );
        },
      ),
    );
  }
}