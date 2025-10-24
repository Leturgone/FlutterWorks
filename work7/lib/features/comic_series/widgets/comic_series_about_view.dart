import 'package:flutter/material.dart';
import 'package:work7/features/comic_series/models/comic_series.dart';

class ComicSeriesAboutView extends StatelessWidget {
  final ComicSeries series;
  final VoidCallback onBack;

  const ComicSeriesAboutView({super.key, required this.series, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              series.image,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              series.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Writer: ${series.writer}',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                series.description ?? 'Нет описания',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: onBack,
              child: Text('Назад'),
            ),
          ],
        ),
      ),
    );
  }
}