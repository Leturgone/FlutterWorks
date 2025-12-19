
import 'package:work12/core/models/user.dart';
import 'dart:math';

class AuthDataSource {

  final List<User> _users = [
    User(id: 3,
        username:'11', name: '11', notesCount: 0, token: '123')
  ];

  // Генерация простого токена (строка)
  static String _generateToken() {
    return '123';
  }

  // Логин
  Future<User?> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2)); // Имитация API запроса

    // Тестовые данные для входа
    if (password != 'password') {
      return null;
    }

    // Ищем пользователя по email
    final user = _users.firstWhere(
          (user) => user.username == email,
      orElse: () => User(
        id: -1,
        username: '',
        name: '',
        notesCount: 0,
        token: '',
      ),
    );

    if (user.id == -1) {
      return null;
    }

    // Возвращаем пользователя с новым токеном
    return user.copyWith(token: _generateToken());
  }

  // Регистрация
  Future<User?> register(String name, String email, String password, String confirmPassword) async {
    await Future.delayed(Duration(seconds: 2)); // Имитация API запроса

    // Валидация
    if (password != confirmPassword) {
      throw Exception('Пароли не совпадают');
    }

    if (password.length < 8) {
      throw Exception('Пароль должен содержать минимум 8 символов');
    }


    // Создаем нового пользователя
    final newUser = User(
      id: _users.length + 1,
      username: email,
      name: name,
      notesCount: 0,
      token: _generateToken(),
    );

    _users.add(newUser);

    return newUser;
  }

  // Получение профиля по ID
  Future<User?> getProfile(int id) async {
    await Future.delayed(Duration(seconds: 1)); // Имитация задержки

    try {
      return _users.firstWhere((user) => user.id == id);
    } catch (e) {
      return null;
    }
  }

  // Получение профиля по токену (для проверки авторизации)
  Future<User?> getProfileByToken(String token) async {
    await Future.delayed(Duration(milliseconds: 500));

    try {
      return _users.firstWhere((user) => user.token == token);
    } catch (e) {
      return null;
    }
  }

}