
import 'package:work12/core/models/user.dart';

abstract class AuthRepository {
  Future<String?> login(String login, String password);
  Future<String?> register(String name, String login, String password);
  Future<User?> getProfile(int id);
  Future<User?> getProfileByToken();
  Future<User?> autoLogin();
}