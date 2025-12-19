
import '../../../core/models/news.dart';
import 'package:mobx/mobx.dart';
part 'news_list_store.g.dart';

class NewsListStore = _NewsListStore with _$NewsListStore;

abstract class _NewsListStore with Store {
  @observable
  ObservableList<News> newsList = ObservableList<News>();

  @observable
  bool isLoading = false;

  @action
  Future<void> loadNews() async {
    isLoading = true;
    final fetchedNews = await fetchNewsFromApi();
    newsList = ObservableList.of(fetchedNews);
    isLoading = false;
  }

  Future<List<News>> fetchNewsFromApi() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      News(
        id: 1,
        title: "Marvel Announces New Comic Series",
        description: "Marvel Comics has announced a brand new series featuring fan-favorite characters. The series will explore new storylines and introduce fresh characters to the universe.",
        image: "https://cdn.marvel.com/content/2x/nova_centurion_1.jpg",
        date: DateTime.now().subtract(Duration(days: 1)),
        author: "Jane Smith",
      ),
      News(
        id: 2,
        title: "Upcoming Movie Release Details",
        description: "Details about the highly anticipated movie release have been revealed, including cast information and release dates.",
        image: "https://cdn.marvel.com/content/2x/fantasticfour_johnnyreed_0.jpg",
        date: DateTime.now().subtract(Duration(days: 3)),
        author: "Mike Johnson",
      ),
    ];
  }
}