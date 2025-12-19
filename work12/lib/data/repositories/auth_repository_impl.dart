
import 'package:work12/core/models/user.dart';
import 'package:work12/data/datasources/api/auth_datasource.dart';
import 'package:work12/domain/interfaces/repositories/auth_repository.dart';

import '../datasources/local/token_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _dataSource;
  final LocalAuthDataSource _localDataSource;

  AuthRepositoryImpl(this._dataSource, this._localDataSource);

  @override
  Future<String> login(String login, String password) async {
    try {
      final user = await _dataSource.login(login, password);
      if (user == null) {
        throw Exception('Неверный email или пароль');
      }
      final result = await _localDataSource.saveToken(user.token);
      if (result == null) {
        throw Exception('Неверный email или пароль');
      }
      return result;
    } catch (e) {
      throw Exception('Ошибка авторизации: $e');
    }
  }

  @override
  Future<String> register(String name, String email, String password) async {
    try {
      final user = await _dataSource.register(name, email, password, password);
      if (user == null) {
        throw Exception('Ошибка регистрации');
      }
      final result = await _localDataSource.saveToken(user.token);
      if (result == null) {
        throw Exception('Неверный email или пароль');
      }
      return result;
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


  Future<User?> getProfileByToken() async {
    try {
      final token = await _localDataSource.getToken();
      if (token == null) return null;

      return await _dataSource.getProfileByToken(token);
    } catch (e) {
      return null;
    }
  }

}