import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:work11/features/comic_series/stores/comic_series_about_store.dart';
import 'package:work11/features/comic_series/widgets/comic_series_about_view.dart';

class ComicSeriesAboutScreen extends StatelessWidget {
  final ComicSeriesAboutStore store = ComicSeriesAboutStore();
  final int seriesId;
  ComicSeriesAboutScreen({super.key, required this.seriesId}){
    store.loadSeries(seriesId);
  }
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
        body: Observer(
            builder:  (_) {
              if (store.isLoading) {
                return Center(child: CircularProgressIndicator());
              }
              final series = store.series;
              if (series == null) {
                return Center(child: Text('Нет данных'));
              }
              return ComicSeriesAboutView(series: series);
            }
        )
    );
  }
}