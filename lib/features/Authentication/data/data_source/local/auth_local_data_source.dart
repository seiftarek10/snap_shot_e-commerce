import 'package:snap_shot/core/models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> saveUserData({required UserModel userData});
  UserModel? getUserData();
  Future<void> setFirstTime();
}
