
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:work11/domain/usecases/auth/login_usecase.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

  final LoginUseCase loginUseCase  = GetIt.I<LoginUseCase>();

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
}