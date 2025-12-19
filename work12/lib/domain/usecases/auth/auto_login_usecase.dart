
import '../../../core/models/user.dart';
import '../../interfaces/repositories/auth_repository.dart';

class AutoLoginUseCase {
  final AuthRepository _authRepository;

  AutoLoginUseCase(this._authRepository);

  Future<User?> execute() async {
    try {
      return await _authRepository.autoLogin();
    } catch (e) {
      print('AutoLoginUseCase error: $e');
      return null;
    }
  }
}