import '../../../core/models/news.dart';

abstract class NewsRepository {
  Future<List<News>> getGamesNews();
  Future<List<News>> getComicsNews();
  Future<List<News>> getMoviesNews();
  Future<News> getNewsById(int id);
}