
import 'dart:async';

import '../../core/models/comic_series.dart';
import '../../domain/interfaces/repositories/comic_series_repository.dart';
import '../datasources/api/comic_series_datasource.dart';

class ComicSeriesRepositoryImpl implements ComicSeriesRepository {
  final ComicSeriesDataSource _dataSource;

  ComicSeriesRepositoryImpl(this._dataSource);

  @override
  Future<List<ComicSeries>> getComicSeriesList() async {
    try {
      final seriesList = await _dataSource.fetchSeriesList();
      return seriesList;
    } catch (e) {
      throw Exception('Failed to load comic series list: $e');
    }
  }

  @override
  Future<ComicSeries> getComicSeriesById(int id) async {
    try {
      final series = await _dataSource.fetchSeries(id);
      return series;
    } catch (e) {
      throw Exception('Failed to load comic series with id $id: $e');
    }
  }
}