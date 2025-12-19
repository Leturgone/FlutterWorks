import 'package:work12/core/models/user.dart';
import 'package:work12/domain/interfaces/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository ;

  RegisterUseCase(this.repository);

  Future<String?> execute(String name,String login, String password) {
    return repository.register(name, login, password);
  }
}