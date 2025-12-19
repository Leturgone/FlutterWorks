import 'package:work12/core/models/user.dart';
import 'package:work12/domain/interfaces/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository ;

  LoginUseCase(this.repository);

  Future<String?> execute(String login, String password) {
    return repository.login(login, password);
  }
}