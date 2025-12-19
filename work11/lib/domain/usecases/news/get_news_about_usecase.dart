
import '../../../core/models/news.dart';
import '../../interfaces/repositories/news_repository.dart';

class GetNewsAboutUseCase {
  final NewsRepository repository;

  GetNewsAboutUseCase(this.repository);

  Future<News> execute(int id) {
    return repository.getNewsById(id);
  }
}