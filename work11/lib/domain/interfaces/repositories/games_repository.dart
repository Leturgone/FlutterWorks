
import 'package:work11/core/models/game.dart';


abstract class GamesRepository {
  Future<List<Game>> getGamesList();
  Future<Game> getGameById(int id);
}