
import 'package:mobx/mobx.dart';

import '../../../../core/models/news.dart';
part 'news_about_store.g.dart';

class NewsAboutStore = _NewsAboutStore with _$NewsAboutStore;


abstract class _NewsAboutStore with Store {
  @observable
  News? news;

  @observable
  bool isLoading = false;

  @action
  Future loadNews(int newsId) async {
    isLoading = true;
    await Future.delayed(Duration(seconds: 2));
    news = mockFetchNews(newsId);
    isLoading = false;
  }

  News mockFetchNews(int id) {
    switch(id){
      case 1 : return News(
        id: 1,
        title: "Marvel Announces New Comic Series",
        description: "Marvel Comics has announced a brand new series featuring fan-favorite characters. The series will explore new storylines and introduce fresh characters to the universe.",
        image: "https://cdn.marvel.com/content/2x/nova_centurion_1.jpg",
        date: DateTime.now().subtract(Duration(days: 1)),
        author: "Jane Smith",
    );
      case 2: return News(
        id: 2,
        title: "Upcoming Movie Release Details",
        description: "Details about the highly anticipated movie release have been revealed, including cast information and release dates.",
        image: "https://cdn.marvel.com/content/2x/fantasticfour_johnnyreed_0.jpg",
        date: DateTime.now().subtract(Duration(days: 3)),
        author: "Mike Johnson",
      );
    }
    throw Error();

  }
}