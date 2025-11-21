import 'package:mobx/mobx.dart';
import '../models/movie.dart';
part 'movie_list_store.g.dart';


class MovieListStore = _MovieListStore with _$MovieListStore;

abstract class _MovieListStore with Store {
  @observable
  ObservableList<Movie> movieList = ObservableList<Movie>();

  @observable
  bool isLoading = false;

  @action
  Future<void> loadMovies() async {
    isLoading = true;
    final fetchedMovies = await fetchMoviesFromApi();
    movieList = ObservableList.of(fetchedMovies);
    isLoading = false;
  }

  Future<List<Movie>> fetchMoviesFromApi() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      Movie(
        id: 1,
        title: "Avengers: Endgame",
        description: "After the devastating events of Avengers: Infinity War, the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos' actions and restore balance to the universe.",
        image: "https://upload.wikimedia.org/wikipedia/kk/thumb/9/9b/Avengers_Endgame.jpg/500px-Avengers_Endgame.jpg",
        director: "Anthony and Joe Russo",
        year: 2019,
      ),
      Movie(
        id: 2,
        title: "Spider-Man: No Way Home",
        description: "With Spider-Man's identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.",
        image: "https://upload.wikimedia.org/wikipedia/ru/thumb/6/6e/Spider-Man_%E2%80%94_No_Way_Home_poster.jpg/500px-Spider-Man_%E2%80%94_No_Way_Home_poster.jpg",
        director: "Jon Watts",
        year: 2021,
      ),
    ];
  }
}