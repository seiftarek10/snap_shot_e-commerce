import 'package:snap_shot/core/models/user_model.dart';

abstract class AllUsersRemoteDataSource {
  Future<List<UserModel>> getAllUsers({required int limit, required String? lastId});
}