import '../../../core/models/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getMoviesList();
  Future<Movie> getMovieById(int id);
}