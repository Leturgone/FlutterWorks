import 'package:flutter/material.dart';
import 'package:work5/features/comic_series/widgets/comic_series_tile.dart';

import '../models/comic_series.dart';


class ComicSeriesListView extends StatelessWidget {
  final List<ComicSeries> seriesList;
  final ValueChanged<ComicSeries> onSeriesTap;

  const ComicSeriesListView({
    super.key,
    required this.seriesList,
    required this.onSeriesTap,
  });

  @override
  Widget build(BuildContext context) {
    if (seriesList.isEmpty) {
      return const Center(
        child: Text(
          'Список серий пуст',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: seriesList.length,
      itemBuilder: (context, index) {
        final series = seriesList[index];
        return ComicSeriesTile(series: series, onTap: onSeriesTap,);
      },
    );
  }
}
