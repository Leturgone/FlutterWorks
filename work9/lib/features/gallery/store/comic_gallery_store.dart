
import 'package:mobx/mobx.dart';
part 'comic_gallery_store.g.dart';

class ComicGalleryStore = _ComicGalleryStore with _$ComicSeriesListStore;

abstract class _ComicGalleryStore with Store {
  @observable
  ObservableList<String> coverList = ObservableList<String>();

  @observable
  bool isLoading = false;

  @action
  Future<void> loadSeries() async {
    isLoading = true;
    // Моковое получение изображений
    final fetchedImages= await fetchImagesFromApi();
    coverList = ObservableList.of(fetchedImages);
    isLoading = false;
  }

  // Мока функции получения данных
  Future<List<String>> fetchImagesFromApi() async {
    await Future.delayed(Duration(seconds: 2)); //// имитация задержки
    List<String> imageUrls = [
      "https://i.annihil.us/u/prod/marvel/i/mg/1/d0/519bad24bebcd.jpg",
      "https://cdn.marvel.com/u/prod/marvel/i/mg/4/90/659c61377f79c/standard_incredible.jpg",
      "https://cdn.marvel.com/u/prod/marvel/i/mg/6/f0/68c053ab8d985/standard_incredible.jpg",
      "https://cdn.marvel.com/u/prod/marvel/i/mg/4/60/68e6a1293e977/standard_incredible.jpg",
      "https://cdn.marvel.com/u/prod/marvel/i/mg/4/80/575ef36168a99/standard_incredible.jpg"
    ];
    return imageUrls;
  }
}
