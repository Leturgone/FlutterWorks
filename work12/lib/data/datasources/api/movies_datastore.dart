



import '../../../core/models/movie.dart';

class MoviesDataSource{

  final List<Movie> _movieList = [
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

  Future<Movie> fetchMovie(int id) async{
    await Future.delayed(Duration(seconds: 2)); //// имитация задержки
    return _movieList.firstWhere(
          (movie) => movie.id == id,
      orElse: () => throw Exception('Movie with id $id not found'),
    );
  }

  Future<List<Movie>> fetchMovieList() async {
    await Future.delayed(Duration(seconds: 2)); //// имитация задержки

    return _movieList;
  }
}