
import 'package:work11/core/models/user.dart';

abstract class GamesRepository {
  Future<User> login(String login, password);
  Future<User> register(String name, String login, String password);
}