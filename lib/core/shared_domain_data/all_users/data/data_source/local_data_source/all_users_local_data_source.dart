import 'package:snap_shot/core/models/user_model.dart';

abstract class AllUsersLocalDataSource {
  List<String> getAllUsersIds({required int limit, required String? lastId});
  Future<List<UserModel>> getAllUsers({required List<String> usersIds});
  Future<void> cacheAllUsers({required List<UserModel> users});
  Future<void> clearUsersIds();
  Future<void> clearUsersBox();
  Future<void> updateLastUpdateTime({required String lastUpdateTime});
  Future< String?> getLastUpdateTime();
}
