
class AuthDataSource {
  Future<bool> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2)); // Имитация API запроса
    // Тестовые данные для входа
    if (email == 'user@example.com' && password == 'password') {
      return true;
    } else {
      return false;
    }
  }
}