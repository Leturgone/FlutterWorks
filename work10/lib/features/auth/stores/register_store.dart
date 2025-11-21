import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStore with _$RegisterStore;

abstract class _RegisterStore with Store {
  @observable
  bool isLoading = false;

  @observable
  String? error;

  @observable
  String username = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @action
  void setUsername(String name){
    username = name;
  }

  @action
  void setEmail(String mail){
    email = mail;
  }

  @action
  void setPassword(String pass){
    password = pass;
  }

  @action
  void setConfirmPassword(String pass){
    confirmPassword = pass;
  }

  @action
  Future<bool> register() async {
    isLoading = true;
    error = null;

    await Future.delayed(Duration(seconds: 2)); // Имитация API запроса

    // Валидация
    if (password != confirmPassword) {
      error = 'Пароли не совпадают';
      isLoading = false;
      return false;
    }

    if (password.length < 8) {
      error = 'Пароль должен быть не менее 8 символов';
      isLoading = false;
      return false;
    }

    // Успешная регистрация
    isLoading = false;
    return true;
  }

}