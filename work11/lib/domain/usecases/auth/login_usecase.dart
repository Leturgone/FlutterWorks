import 'package:work11/core/models/user.dart';
import 'package:work11/domain/interfaces/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository ;

  LoginUseCase(this.repository);

  Future<User> execute(String login, String password) {
    return repository.login(login, password);
  }
}