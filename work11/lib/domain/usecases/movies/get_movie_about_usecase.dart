
import 'package:work11/core/models/movie.dart';
import 'package:work11/domain/interfaces/repositories/movies_repository.dart';

class GetMovieAboutUseCase {
  final MoviesRepository repository;

  GetMovieAboutUseCase(this.repository);

  Future<Movie> execute(int id) {
    return repository.getMovieById(id);
  }
}