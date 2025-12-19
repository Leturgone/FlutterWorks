
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:work12/domain/usecases/auth/auto_login_usecase.dart';
import 'package:work12/domain/usecases/auth/login_usecase.dart';

import '../../../../core/models/user.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

  final LoginUseCase loginUseCase  = GetIt.I<LoginUseCase>();
  final AutoLoginUseCase autoLoginUseCase = GetIt.I<AutoLoginUseCase>();

  @observable
  bool isLoading = false;

  @observable
  bool isAutoLoginLoading = false;

  @observable
  User? currentUser;

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
    final auto  = tryAutoLogin();
    if (await auto) return true;

    isLoading = true;
    error = null;

    try {
      final result = await loginUseCase.execute(email, password);

      if (result!=null) {
        isLoading = false;
        return true;
      } else {
        isLoading = false;
        return false;
      }
    } catch (e) {
      error = 'Неизвестная ошибка';
      isLoading = false;
      return false;
    }
  }
  @action
  Future<bool> tryAutoLogin() async {
    isAutoLoginLoading = true;
    error = null;

    try {
      print('Trying auto login...');
      final user = await autoLoginUseCase.execute();

      if (user != null) {
        currentUser = user;
        print('Auto login successful for: ${user.username}');
        isAutoLoginLoading = false;
        return true;
      } else {
        print('Auto login failed - no valid token');
        isAutoLoginLoading = false;
        return false;
      }
    } catch (e) {
      print('Auto login error: $e');
      error = 'Ошибка автоматического входа';
      isAutoLoginLoading = false;
      return false;
    }
  }

}