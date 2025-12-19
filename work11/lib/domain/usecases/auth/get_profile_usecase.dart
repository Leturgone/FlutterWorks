import 'package:work11/core/models/user.dart';
import 'package:work11/domain/interfaces/repositories/auth_repository.dart';

class GetProfileUseCase{
  final AuthRepository repository ;

  GetProfileUseCase(this.repository);

  Future<User?> execute(int id) {
    return repository.getProfile(id);
  }
}