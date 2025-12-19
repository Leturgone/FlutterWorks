import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:work12/domain/usecases/movies/get_movie_about_usecase.dart';

import '../../../../core/models/movie.dart';

part 'movie_about_store.g.dart';


class MovieAboutStore = _MovieAboutStore with _$MovieAboutStore;

abstract class _MovieAboutStore with Store {
  @observable
  Movie? movie;

  @observable
  bool isLoading = false;

  final GetMovieAboutUseCase getMovieAboutUseCase = GetIt.I<GetMovieAboutUseCase>();

  @action
  Future loadMovie(int movieId) async {
    isLoading = true;
    movie = await getMovieAboutUseCase.execute(movieId);
    isLoading = false;
  }
}