import 'package:work11/core/models/user.dart';
import 'package:work11/domain/interfaces/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository ;

  RegisterUseCase(this.repository);

  Future<User> execute(String name,String login, String password) {
    return repository.register(name, login, password);
  }
}