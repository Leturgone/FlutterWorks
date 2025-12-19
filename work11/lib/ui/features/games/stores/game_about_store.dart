
import 'package:mobx/mobx.dart';

import '../../../../core/models/game.dart';

part 'game_about_store.g.dart';

class GameAboutStore = _GameAboutStore with _$GameAboutStore;

abstract class _GameAboutStore with Store {
  @observable
  Game? game;

  @observable
  bool isLoading = false;

  @action
  Future loadGame(int gameId) async {
    isLoading = true;
    await Future.delayed(Duration(seconds: 2));
    game = mockFetchGame(gameId);
    isLoading = false;
  }

  Game mockFetchGame(int id) {
    switch(id){
      case 1 : return Game(
        id: 1,
        title: "Spider-Man: Miles Morales",
        description: "Experience the rise of Miles Morales as the new hero masters incredible, explosive new powers to become his own Spider-Man.",
        image: "https://cdn.marvel.com/content/2x/msmmm_lob_crd_02_0.jpg",
        developer: "Insomniac Games",
        platform: "PS5/PS4/PC",
      );
      case 2: return Game(
        id: 2,
        title: "Marvel's Avengers",
        description: "Assemble your team of Earth's Mightiest Heroes and embrace your powers in this epic action-adventure.",
        image: "https://cdn.marvel.com/content/2x/marvelsavengers_lob_crd_01_0.jpg",
        developer: "Crystal Dynamics",
        platform: "Multiplatform",
      );
    }
    throw Error();
  }
}