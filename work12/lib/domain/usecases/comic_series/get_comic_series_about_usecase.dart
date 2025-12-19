
import 'package:work12/core/models/comic_series.dart';
import 'package:work12/domain/interfaces/repositories/comic_series_repository.dart';

class GetComicSeriesAboutUseCase {
  final ComicSeriesRepository repository ;

  GetComicSeriesAboutUseCase(this.repository);

  Future<ComicSeries> execute(int id) {
    return repository.getComicSeriesById(id);
  }
}