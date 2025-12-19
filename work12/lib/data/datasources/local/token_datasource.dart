class LocalAuthDataSource {
  String? _token;

  Future<String?> saveToken(String token) async {
    await Future.delayed(Duration(milliseconds: 100)); // Имитация задержки
    _token = token;
    return _token;
  }

  Future<String?> getToken() async {
    await Future.delayed(Duration(milliseconds: 100)); // Имитация задержки
    return _token;
  }

  Future<void> clearToken() async {
    await Future.delayed(Duration(milliseconds: 100)); // Имитация задержки
    _token = null;
  }
}