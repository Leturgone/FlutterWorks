import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalAuthDataSource {
  static const _tokenKey = 'auth_token';
  final FlutterSecureStorage _secureStorage;

  LocalAuthDataSource() : _secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  Future<String?> saveToken(String token) async {
    try {
      await _secureStorage.write(key: _tokenKey, value: token);
      return token;
    } catch (e) {
      print('Error saving token: $e');
      return null;
    }
  }

  Future<String?> getToken() async {
    try {
      return await _secureStorage.read(key: _tokenKey);
    } catch (e) {
      print('Error getting token: $e');
      return null;
    }
  }

  Future<void> clearToken() async {
    try {
      await _secureStorage.delete(key: _tokenKey);
    } catch (e) {
      print('Error clearing token: $e');
    }
  }

  Future<bool> hasToken() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
}