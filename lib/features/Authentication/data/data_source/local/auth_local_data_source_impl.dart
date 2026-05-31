import 'package:snap_shot/core/data_source/local_data_source/local_data_base_interface.dart';
import 'package:snap_shot/features/authentication/data/data_source/local/auth_local_data_source.dart';
import 'package:snap_shot/core/models/user_model.dart';

class AuthLocaldataSourceImpl extends AuthLocalDataSource {
  final ILocalDataBaseServices<UserModel> _userBox;
  final ILocalDataBaseServices<bool> _firstTimeBox;

  AuthLocaldataSourceImpl(this._userBox, this._firstTimeBox);
  @override
  Future<void> saveUserData({required UserModel userData}) async {
    await _userBox.addDataWithKey(
      key: userData.uid,
      data: userData,
    );
  }

  @override
  UserModel? getUserData() {
    final userData = _userBox.getAllData();
    if (userData.isEmpty) {
      return null;
    }

    return userData.first;
  }

  @override
  Future<void> setFirstTime() async {
    await _firstTimeBox.addDataWithKey(key: 'FirstTime', data: false);
  }
}
