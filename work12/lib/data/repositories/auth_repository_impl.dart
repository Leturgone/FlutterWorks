
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

      // Сохраняем токен
      final savedToken = await _localDataSource.saveToken(user.token);
      if (savedToken == null) {
        throw Exception('Ошибка сохранения токена');
      }

      return savedToken;
    } catch (e) {
      // Логируем ошибку для отладки
      print('Login error in repository: $e');
      throw Exception('Ошибка авторизации: ${e.toString()}');
    }
  }

  @override
  Future<String> register(String name, String email, String password) async {
    try {
      final user = await _dataSource.register(name, email, password, password);
      if (user!=null){
        // Сохраняем токен
        final savedToken = await _localDataSource.saveToken(user.token);
        if (savedToken == null) {
          throw Exception('Ошибка сохранения токена');
        }
        return savedToken;
      }
      throw Exception('Ошибка авторизации');
    } catch (e) {
      // Логируем ошибку для отладки
      print('Register error in repository: $e');

      if (e is Exception) {
        rethrow;
      }
      throw Exception('Ошибка регистрации: ${e.toString()}');
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
      print('Get profile error: $e');
      throw Exception('Ошибка загрузки профиля: ${e.toString()}');
    }
  }

  Future<User?> getProfileByToken() async {
    try {
      final token = await _localDataSource.getToken();
      if (token == null) {
        print('No token found');
        return null;
      }

      print('Token found, length: ${token.length}');
      final user = await _dataSource.getProfileByToken(token);

      if (user == null) {
        print('No user found for token');
        // Очищаем невалидный токен
        await _localDataSource.clearToken();
      }

      return user;
    } catch (e) {
      print('Error in getProfileByToken: $e');
      return null;
    }
  }

  // Добавьте метод для проверки авторизации
  Future<bool> isAuthenticated() async {
    try {
      final token = await _localDataSource.getToken();
      return token != null && token.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  // Добавьте метод для выхода
  Future<void> logout() async {
    try {
      await _localDataSource.clearToken();
    } catch (e) {
      print('Logout error: $e');
    }
  }
  @override
  Future<User?> autoLogin() async {
    try {
      // 1. Проверяем есть ли токен
      final token = await _localDataSource.getToken();
      if (token == null || token.isEmpty) {
        print('No token found for auto login');
        return null;
      }

      print('Auto login with token: ${token.substring(0, 3)}...');

      // 2. Получаем пользователя по токену
      final user = await _dataSource.getProfileByToken(token);

      if (user == null) {
        print('No user found for token, clearing token');
        // Токен невалидный, удаляем его
        await _localDataSource.clearToken();
        return null;
      }

      print('Auto login successful for user: ${user.username}');
      return user;
    } catch (e) {
      print('Auto login error: $e');
      return null;
    }
  }

}