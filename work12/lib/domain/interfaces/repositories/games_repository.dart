
import 'package:work12/core/models/game.dart';


abstract class GamesRepository {
  Future<List<Game>> getGamesList();
  Future<Game> getGameById(int id);
}