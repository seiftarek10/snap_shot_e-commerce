import 'package:snap_shot/core/constants/app_constants.dart';
import 'package:snap_shot/core/data_source/local_data_source/local_data_base_interface.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/core/shared_domain_data/all_users/data/data_source/local_data_source/all_users_local_data_source.dart';

class AllUsersLocalDataSourceImpl implements AllUsersLocalDataSource {
  final ILocalDataBaseServices<UserModel> _usersBox;
  final ILocalDataBaseServices<String> _usersIdsBox;
  final ILocalDataBaseServices<String> _versionsBox;

  AllUsersLocalDataSourceImpl(
    this._usersBox,
    this._usersIdsBox,
    this._versionsBox,
  );

  @override
  List<String> getAllUsersIds({required int limit, required String? lastId}) {
    if (_usersIdsBox.isEmpty()) {
      return [];
    }
    if (lastId == null) {
      return _usersIdsBox.getAllData().take(limit).toList();
    }
    List<String> allIds = _usersIdsBox.getAllData();
    final lastIdIndex = allIds.indexOf(lastId);
    if (lastIdIndex == -1 || lastIdIndex == allIds.length - 1) {
      return [];
    }
    return allIds.skip(lastIdIndex + 1).take(limit).toList();
  }

  @override
  Future<void> cacheAllUsers({required List<UserModel> users}) async {
    for (var user in users) {
      if (_usersIdsBox.containsKey(key: user.uid)) {
        continue;
      }

      await _usersIdsBox.addDataWithKey(key: user.uid, data: user.uid);
      await _usersBox.addDataWithKey(key: user.uid, data: user);
    }
  }

  @override
  Future<List<UserModel>> getAllUsers({required List<String> usersIds}) async {
    List<UserModel> users = [];
    for (var id in usersIds) {
      final user = await _usersBox.getData(key: id);
      if (user != null) {
        users.add(user);
      }
    }
    return users;
  }

  @override
  Future<void> clearUsersIds() async {
    await _usersIdsBox.clear();
  }

  @override
  Future<void> clearUsersBox() async {
    await _usersBox.clear();
  }

  @override
  Future<void> updateLastUpdateTime({required String lastUpdateTime}) async {
    await _versionsBox.addDataWithKey(
      key: AppConstants.instance.lastUpdateKey,
      data: lastUpdateTime,
    );
  }

  @override
  Future<String?> getLastUpdateTime() async {
    String? lastUpdateTime = await _versionsBox.getData(
      key: AppConstants.instance.lastUpdateKey,
    );

    return lastUpdateTime;
  }
}
