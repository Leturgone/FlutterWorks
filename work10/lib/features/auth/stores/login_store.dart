
import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  bool isLoading = false;

  @observable
  String? error;

  @observable
  String email = '';

  @observable
  String password = '';

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  Future<bool> login() async {
    isLoading = true;
    error = null;

    await Future.delayed(Duration(seconds: 2)); // Имитация API запроса

    // Тестовые данные для входа
    if (email == 'user@example.com' && password == 'password') {
      isLoading = false;
      return true;
    } else {
      error = 'Неверный email или пароль';
      isLoading = false;
      return false;
    }
  }
}