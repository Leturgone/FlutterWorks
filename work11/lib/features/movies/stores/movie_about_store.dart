import 'package:mobx/mobx.dart';
import '../../../core/models/movie.dart';
part 'movie_about_store.g.dart';


class MovieAboutStore = _MovieAboutStore with _$MovieAboutStore;

abstract class _MovieAboutStore with Store {
  @observable
  Movie? movie;

  @observable
  bool isLoading = false;

  @action
  Future loadMovie(int movieId) async {
    isLoading = true;
    await Future.delayed(Duration(seconds: 2));
    movie = mockFetchMovie(movieId);
    isLoading = false;
  }

  Movie mockFetchMovie(int id) {
    switch(id){
      case 1 : return Movie(
        id: 1,
        title: "Avengers: Endgame",
        description: "After the devastating events of Avengers: Infinity War, the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos' actions and restore balance to the universe.",
        image: "https://upload.wikimedia.org/wikipedia/kk/thumb/9/9b/Avengers_Endgame.jpg/500px-Avengers_Endgame.jpg",
        director: "Anthony and Joe Russo",
        year: 2019,
      );
      case 2: return Movie(
        id: 2,
        title: "Spider-Man: No Way Home",
        description: "With Spider-Man's identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.",
        image: "https://upload.wikimedia.org/wikipedia/ru/thumb/6/6e/Spider-Man_%E2%80%94_No_Way_Home_poster.jpg/500px-Spider-Man_%E2%80%94_No_Way_Home_poster.jpg",
        director: "Jon Watts",
        year: 2021,
      );
    }
    throw Error();
  }
}