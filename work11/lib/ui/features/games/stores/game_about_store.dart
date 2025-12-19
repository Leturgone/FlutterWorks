
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:work11/domain/usecases/games/get_game_about_usecase.dart';

import '../../../../core/models/game.dart';

part 'game_about_store.g.dart';

class GameAboutStore = _GameAboutStore with _$GameAboutStore;

abstract class _GameAboutStore with Store {
  @observable
  Game? game;

  @observable
  bool isLoading = false;

  final GetGameAboutUseCase getGameAboutUseCase = GetIt.I<GetGameAboutUseCase>();

  @action
  Future loadGame(int gameId) async {
    isLoading = true;
    game = await getGameAboutUseCase.execute(gameId);
    isLoading = false;
  }

}