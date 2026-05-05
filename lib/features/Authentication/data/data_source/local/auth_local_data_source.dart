import 'package:snap_shot/features/authentication/data/models/user_model.dart';

abstract class AuthLocalDataSource{
  Future<void> saveUserData({required UserModel userData});
}
