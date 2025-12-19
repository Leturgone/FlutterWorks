import '../../../core/models/news.dart';

abstract class NewsRepository {
  Future<List<News>> getPopCultNews();
  Future<News> getNewsById(int id);
}