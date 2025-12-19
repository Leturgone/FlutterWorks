


import '../../../core/models/movie.dart';
import '../../interfaces/repositories/movies_repository.dart';

class GetMoviesListUseCase {
  final MoviesRepository repository;

  GetMoviesListUseCase(this.repository);

  Future<List<Movie>> execute() {
    return repository.getMoviesList();
  }
}