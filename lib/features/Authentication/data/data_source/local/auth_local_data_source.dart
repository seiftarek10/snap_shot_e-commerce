import 'package:snap_shot/core/entites/user_entity.dart';

abstract class AuthLocalDataSource{
  Future<void> saveUserData({required UserEntity userData});
}
