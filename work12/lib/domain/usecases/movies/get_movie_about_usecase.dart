
import 'package:work12/core/models/movie.dart';
import 'package:work12/domain/interfaces/repositories/movies_repository.dart';

class GetMovieAboutUseCase {
  final MoviesRepository repository;

  GetMovieAboutUseCase(this.repository);

  Future<Movie> execute(int id) {
    return repository.getMovieById(id);
  }
}