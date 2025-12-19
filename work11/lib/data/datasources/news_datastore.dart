

import '../../core/models/news.dart';


class NewsDataSource{

  final List<News> _newsList = [
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

  Future<News> fetchNews(int id) async{
    await Future.delayed(Duration(seconds: 2)); //// имитация задержки
    return _newsList.firstWhere(
          (news) => news.id == id,
      orElse: () => throw Exception('News with id $id not found'),
    );
  }

  Future<List<News>> fetchNewsList() async {
    await Future.delayed(Duration(seconds: 2)); //// имитация задержки

    return _newsList;
  }
}