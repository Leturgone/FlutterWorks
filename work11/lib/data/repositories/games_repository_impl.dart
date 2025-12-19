

import 'package:work11/domain/interfaces/repositories/games_repository.dart';

import '../../core/models/game.dart';
import '../datasources/api/games_datasource.dart';

class GamesRepositoryImpl implements GamesRepository {
  final GamesDataSource _dataSource;

  GamesRepositoryImpl(this._dataSource);

  @override
  Future<List<Game>> getGamesList() async {
    try {
      final seriesList = await _dataSource.fetchGameList();
      return seriesList;
    } catch (e) {
      throw Exception('Failed to load games list: $e');
    }
  }

  @override
  Future<Game> getGameById(int id) async {
    try {
      final series = await _dataSource.fetchGame(id);
      return series;
    } catch (e) {
      throw Exception('Failed to load game with id $id: $e');
    }
  }
}