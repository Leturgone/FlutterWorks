import '../../../core/models/news.dart';
import '../../interfaces/repositories/news_repository.dart';

class GetNewsUseCase {
  final NewsRepository repository;

  GetNewsUseCase(this.repository);

  Future<List<News>> execute() {
    return repository.getPopCultNews();
  }
}