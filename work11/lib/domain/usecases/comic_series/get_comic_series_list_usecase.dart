
import 'package:work11/core/models/comic_series.dart';
import 'package:work11/domain/interfaces/repositories/comic_series_repository.dart';

class GetComicSeriesListUseCase {
  final ComicSeriesRepository repository ;

  GetComicSeriesListUseCase(this.repository);

  Future<List<ComicSeries>> execute() {
    return repository.getComicSeriesList();
  }
}