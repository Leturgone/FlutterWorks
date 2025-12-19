
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:work11/features/comic_series/widgets/comic_series_list_view.dart';

import '../../../core/models/comic_series.dart';
import 'package:flutter/material.dart';

import '../stores/comic_series_list_store.dart';

class ComicSeriesListScreen extends StatelessWidget {
  final ComicSeriesListStore store = ComicSeriesListStore();

  final bool usual;
  final Function(String selectedImage)? onSelectImage;

  ComicSeriesListScreen({super.key, required this.usual, this.onSelectImage}) {
    store.loadSeries(); // Загружаем список при создании
  }

  void onSeriesTap(BuildContext context, ComicSeries series) {
    if (usual) {
      context.push('/series-about', extra: series.id);
    } else {
      if (onSelectImage != null) {
        onSelectImage!(series.image);
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
        title: Text('Серии комиксов'),
      ),
      body: Observer(
        builder: (_) {
          if (store.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (store.seriesList.isEmpty) {
            return Center(child: Text('Нет данных'));
          }
          return ComicSeriesListView(seriesList: store.seriesList, onSeriesTap: (series) => onSeriesTap(context, series));
        },
      ),
    );
  }
}