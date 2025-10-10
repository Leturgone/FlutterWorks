import 'package:flutter/material.dart';
import 'package:work5/features/comic_series/widgets/comic_series_about_view.dart';

import '../models/comic_series.dart';

class ComicSeriesAboutScreen extends StatelessWidget {
  final ComicSeries series;
  final VoidCallback onBack;

  const ComicSeriesAboutScreen({super.key, required this.series, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ComicSeriesAboutWidget(series: series, onBack: onBack)
    );
  }
}