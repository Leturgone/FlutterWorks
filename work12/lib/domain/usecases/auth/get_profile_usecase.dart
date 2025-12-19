import 'package:work12/core/models/user.dart';
import 'package:work12/domain/interfaces/repositories/auth_repository.dart';

class GetProfileUseCase{
  final AuthRepository repository ;

  GetProfileUseCase(this.repository);

  Future<User?> execute() {
    return repository.getProfileByToken();
  }
}