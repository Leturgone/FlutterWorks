import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:work7/features/comic_series/widgets/comic_series_about_view.dart';

import '../models/comic_series.dart';

class ComicSeriesAboutScreen extends StatelessWidget {
  final ComicSeries series;

  const ComicSeriesAboutScreen({super.key, required this.series});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {context.pop();},
          ),
          title: Text('О серии'),
        ),
        body: ComicSeriesAboutView(series: series)
    );
  }
}