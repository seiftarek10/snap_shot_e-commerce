import 'package:snap_shot/core/constants/app_constants.dart';
import 'package:snap_shot/core/data_source/remote_data_source/services/fire_base/collection_path.dart';
import 'package:snap_shot/core/data_source/remote_data_source/services/service_interface.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/core/shared_domain_data/all_users/data/data_source/remote_data_source/all_users_remote_data_source.dart';

class AllUsersRemoteDataSourecImpl implements AllUsersRemoteDataSource {
  final IRemoteDataBaseServices _remoteDataBaseServices;

  AllUsersRemoteDataSourecImpl(this._remoteDataBaseServices);

  @override
  Future<List<UserModel>> getAllUsers({
    required int limit,
    required String? lastId,
  }) async {
    final data = await _remoteDataBaseServices.getAllWithPagination(
      collection: CollectionPath.instance.users,
      limit: limit,
      lastId: lastId,
    );
    List<UserModel> users = data.map((e) => UserModel.fromJson(e)).toList();
    return users;
  }

  @override
  Future<String> getLastUpdateTime() async {
    String lastUpdateUsersList = AppConstants.instance.lastUpdateUsersList;
    final result = await _remoteDataBaseServices.getById(
      collection: CollectionPath.instance.lastUpdates,
      id: lastUpdateUsersList,
    );

    return result["last_update"];
  }
}
