import 'package:mobx/mobx.dart';
import '../models/game.dart';
part 'games_list_store.g.dart';

class GameListStore = _GameListStore with _$GameListStore;

abstract class _GameListStore with Store {
  @observable
  ObservableList<Game> gameList = ObservableList<Game>();

  @observable
  bool isLoading = false;

  @action
  Future<void> loadGames() async {
    isLoading = true;
    final fetchedGames = await fetchGamesFromApi();
    gameList = ObservableList.of(fetchedGames);
    isLoading = false;
  }

  Future<List<Game>> fetchGamesFromApi() async {
    await Future.delayed(Duration(seconds: 2));
    return [
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
  }
}