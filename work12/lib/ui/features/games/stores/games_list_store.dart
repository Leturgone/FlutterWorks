import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:work12/domain/usecases/games/get_game_list_usecase.dart';

import '../../../../core/models/game.dart';
part 'games_list_store.g.dart';

class GameListStore = _GameListStore with _$GameListStore;

abstract class _GameListStore with Store {
  @observable
  ObservableList<Game> gameList = ObservableList<Game>();

  final GetGameListUseCase getGameListUseCase = GetIt.I<GetGameListUseCase>();

  @observable
  bool isLoading = false;

  @action
  Future<void> loadGames() async {
    isLoading = true;
    final fetchedGames = await getGameListUseCase.execute();
    gameList = ObservableList.of(fetchedGames);
    isLoading = false;
  }
}