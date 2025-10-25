
import 'package:work7/features/comic_series/widgets/comic_series_list_view.dart';
import 'package:work7/main_scaffold.dart';

import '../models/comic_series.dart';
import 'package:flutter/material.dart';

class ComicSeriesListScreen extends StatelessWidget {
  final List<ComicSeries> seriesList;
  final ValueChanged<ComicSeries> onSeriesTap;

  const ComicSeriesListScreen({super.key, required this.seriesList, required this.onSeriesTap});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: ComicSeriesListView(seriesList: seriesList, onSeriesTap: onSeriesTap),currentIndex: 0,
    );
  }
}