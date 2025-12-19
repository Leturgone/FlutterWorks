
import 'package:work11/core/models/game.dart';


class GamesDataSource{

  final List<Game> _gameList = [
    Game(
      id: 1,
      title: "Spider-Man: Miles Morales",
      description: "Experience the rise of Miles Morales as the new hero masters incredible, explosive new powers to become his own Spider-Man.",
      image: "https://cdn.marvel.com/content/2x/msmmm_lob_crd_02_0.jpg",
      developer: "Insomniac Games",
      platform: "PS5/PS4/PC",
    ),
    Game(
      id: 2,
      title: "Marvel's Avengers",
      description: "Assemble your team of Earth's Mightiest Heroes and embrace your powers in this epic action-adventure.",
      image: "https://cdn.marvel.com/content/2x/marvelsavengers_lob_crd_01_0.jpg",
      developer: "Crystal Dynamics",
      platform: "Multiplatform",
    ),
  ];

  Future<Game> fetchGame(int id) async{
    await Future.delayed(Duration(seconds: 2)); //// имитация задержки
    return _gameList.firstWhere(
          (game) => game.id == id,
      orElse: () => throw Exception('Game with id $id not found'),
    );
  }

  Future<List<Game>> fetchGameList() async {
    await Future.delayed(Duration(seconds: 2)); //// имитация задержки

    return _gameList;
  }
}