import '../../../core/models/game.dart';
import '../../interfaces/repositories/games_repository.dart';


class GetGameAboutUseCase {
  final GamesRepository repository;

  GetGameAboutUseCase(this.repository);

  Future<Game> execute(int id) {
    return repository.getGameById(id);
  }
}