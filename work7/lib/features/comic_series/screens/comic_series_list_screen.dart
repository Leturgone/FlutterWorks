
import 'package:go_router/go_router.dart';
import 'package:work7/features/comic_series/widgets/comic_series_list_view.dart';

import '../models/comic_series.dart';
import 'package:flutter/material.dart';

class ComicSeriesListScreen extends StatelessWidget {
  final List<ComicSeries> seriesList;
  final bool usual;
  final Function(String selectedImage)? onSelectImage;

  const ComicSeriesListScreen({super.key, required this.seriesList, required this.usual, this.onSelectImage});

  void onSeriesTap(BuildContext context,ComicSeries series) {
    if (usual == true){
      context.push('/series-about', extra: series);
    }else{
      onSelectImage!(series.image);
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {context.pop();},
        ),
        title: Text('Серии комиксов'),
      ),
      body: ComicSeriesListView(seriesList: seriesList, onSeriesTap: (series) => onSeriesTap(context, series)),
    );
  }
}