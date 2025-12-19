
import 'package:work11/core/models/user.dart';
import 'package:work11/data/datasources/auth_datasource.dart';
import 'package:work11/domain/interfaces/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<User> login(String login, String password) async {
    try {
      final user = await _dataSource.login(login, password);
      if (user == null) {
        throw Exception('Неверный email или пароль');
      }
      return user;
    } catch (e) {
      throw Exception('Ошибка авторизации: $e');
    }
  }

  @override
  Future<User> register(String name, String email, String password) async {
    try {
      final user = await _dataSource.register(name, email, password, password);
      if (user == null) {
        throw Exception('Ошибка регистрации');
      }
      return user;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> getProfile(int id) async {
    try {
      final user = await _dataSource.getProfile(id);
      if (user == null) {
        throw Exception('Пользователь не найден');
      }
      return user;
    } catch (e) {
      throw Exception('Ошибка загрузки профиля: $e');
    }
  }


  Future<User?> getProfileByToken(String token) async {
    try {
      return await _dataSource.getProfileByToken(token);
    } catch (e) {
      return null;
    }
  }

}