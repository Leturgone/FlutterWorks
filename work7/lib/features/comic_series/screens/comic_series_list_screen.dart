
import 'package:work7/features/comic_series/widgets/comic_series_list_view.dart';

import '../models/comic_series.dart';
import 'package:flutter/material.dart';

import 'comic_series_about_screen.dart';

class ComicSeriesListScreen extends StatelessWidget {
  final List<ComicSeries> seriesList;
  final bool usual;
  final Function(String selectedImage)? onSelectImage;

  const ComicSeriesListScreen({super.key, required this.seriesList, required this.usual, this.onSelectImage});

  void onSeriesTap(BuildContext context,ComicSeries series) {
    if (usual == true){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ComicSeriesAboutScreen(series: series),
        ),
      );
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
          onPressed: () {Navigator.of(context).pop();},
        ),
        title: Text('Серии комиксов'),
      ),
      body: ComicSeriesListView(seriesList: seriesList, onSeriesTap: (series) => onSeriesTap(context, series)),
    );
  }
}