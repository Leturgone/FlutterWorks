

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:work12/domain/usecases/auth/get_profile_usecase.dart';

import '../../../../core/models/user.dart';
part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  final GetProfileUseCase getProfileUseCase  = GetIt.I<GetProfileUseCase>();
  @observable
  User? user;

  @observable
  bool isLoading = false;

  @action
  Future<void> loadUserData() async {
    isLoading = true;

    try {
      final profile = getProfileUseCase.execute();

      user = await profile;
    } catch (e) {
      user = null;
    } finally {
      isLoading = false;
    }
  }
}