
import 'package:work11/core/models/movie.dart';
import 'package:work11/data/datasources/movies_datastore.dart';
import 'package:work11/domain/interfaces/repositories/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesDataSource _dataSource;

  MoviesRepositoryImpl(this._dataSource);

  @override
  Future<List<Movie>> getMoviesList() async {
    try {
      final seriesList = await _dataSource.fetchMovieList();
      return seriesList;
    } catch (e) {
      throw Exception('Failed to load movies list: $e');
    }
  }

  @override
  Future<Movie> getMovieById(int id) async {
    try {
      final series = await _dataSource.fetchMovie(id);
      return series;
    } catch (e) {
      throw Exception('Failed to load movie with id $id: $e');
    }
  }
}