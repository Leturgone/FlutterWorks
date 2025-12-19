
import '../../../core/models/game.dart';
import '../../interfaces/repositories/games_repository.dart';

class GetGameListUseCase {
  final GamesRepository repository;

  GetGameListUseCase(this.repository);

  Future<List<Game>> execute() {
    return repository.getGamesList();
  }
}