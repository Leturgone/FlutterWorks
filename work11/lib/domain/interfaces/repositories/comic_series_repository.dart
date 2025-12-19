
import 'package:work11/core/models/comic_series.dart';

abstract class ComicSeriesRepository {
  Future<List<ComicSeries>> getComicSeriesList();
  Future<ComicSeries> getComicSeriesById(int id);
}