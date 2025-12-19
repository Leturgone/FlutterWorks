import 'package:work12/core/models/news.dart';
import 'package:work12/domain/interfaces/repositories/news_repository.dart';

import '../datasources/api/news_datastore.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsDataSource _dataSource;

  NewsRepositoryImpl(this._dataSource);


  @override
  Future<List<News>> getPopCultNews() async {
    try {
      final newsList = await _dataSource.fetchNewsList();
      return newsList;
    } catch (e) {
      throw Exception('Failed to load news list: $e');
    }
  }

  @override
  Future<News> getNewsById(int id) async {
    try {
      final news = await _dataSource.fetchNews(id);
      return news;
    } catch (e) {
      throw Exception('Failed to load news with id $id: $e');
    }
  }
}