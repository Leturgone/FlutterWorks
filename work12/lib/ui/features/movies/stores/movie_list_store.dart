import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:work12/domain/usecases/movies/get_movies_list_usecase.dart';
import '../../../../core/models/movie.dart';
part 'movie_list_store.g.dart';


class MovieListStore = _MovieListStore with _$MovieListStore;

abstract class _MovieListStore with Store {
  @observable
  ObservableList<Movie> movieList = ObservableList<Movie>();

  @observable
  bool isLoading = false;

  final GetMoviesListUseCase getMovieAboutUseCase = GetIt.I<GetMoviesListUseCase>();

  @action
  Future<void> loadMovies() async {
    isLoading = true;
    final fetchedMovies = await getMovieAboutUseCase.execute();
    movieList = ObservableList.of(fetchedMovies);
    isLoading = false;
  }
}