
import '../../../core/models/user.dart';
import 'package:mobx/mobx.dart';
part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  @observable
  User? user;

  @observable
  bool isLoading = false;

  @action
  Future<void> loadUserData() async {
    isLoading = true;
    await Future.delayed(Duration(seconds: 1));
    user = User(
      id: 1,
      username: 'comic_fan',
      notesCount: 2,
    );
    isLoading = false;
  }
}