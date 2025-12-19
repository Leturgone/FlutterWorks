
import 'package:work11/core/models/user.dart';

abstract class AuthRepository {
  Future<User> login(String login, password);
  Future<User> register(String name, String login, String password);
  Future<User> getProfile(int id);
}