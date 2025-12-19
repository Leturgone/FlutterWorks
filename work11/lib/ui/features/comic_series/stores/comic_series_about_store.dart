import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:work11/core/models/comic_series.dart';
import 'package:work11/domain/usecases/comic_series/get_comic_series_about_usecase.dart';

part 'comic_series_about_store.g.dart';

class ComicSeriesAboutStore = _ComicSeriesAboutStore with _$ComicSeriesAboutStore;

abstract class _ComicSeriesAboutStore with Store {

  final GetComicSeriesAboutUseCase getComicSeriesAboutUseCase = GetIt.I<GetComicSeriesAboutUseCase>();

  @observable
  ComicSeries? series;

  @observable
  bool isLoading = false;

  @action
  Future loadSeries(int seriesId) async {
    isLoading = true;
    series = await getComicSeriesAboutUseCase.execute(seriesId);
    isLoading = false;
  }
}