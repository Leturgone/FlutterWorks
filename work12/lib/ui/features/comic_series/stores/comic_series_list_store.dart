import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:work12/core/models/comic_series.dart';
import 'package:work12/domain/usecases/comic_series/get_comic_series_list_usecase.dart';

part 'comic_series_list_store.g.dart';

class ComicSeriesListStore = _ComicSeriesListStore with _$ComicSeriesListStore;

abstract class _ComicSeriesListStore with Store {
  @observable
  ObservableList<ComicSeries> seriesList = ObservableList<ComicSeries>();

  final GetComicSeriesListUseCase getComicSeriesAboutUseCase = GetIt.I<GetComicSeriesListUseCase>();

  @observable
  bool isLoading = false;

  @action
  Future<void> loadSeries() async {
    isLoading = true;
    // Моковое получение серий
    final fetchedSeries = await getComicSeriesAboutUseCase.execute();
    seriesList = ObservableList.of(fetchedSeries);
    isLoading = false;
  }
}