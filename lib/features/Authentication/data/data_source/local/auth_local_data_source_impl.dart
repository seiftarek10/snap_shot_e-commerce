import 'package:snap_shot/core/data_source/local_data_source/local_data_base_interface.dart';
import 'package:snap_shot/features/authentication/data/data_source/local/auth_local_data_source.dart';
import 'package:snap_shot/core/models/user_model.dart';

class AuthLocaldataSourceImpl extends AuthLocalDataSource {
  final ILocalDataBaseServices<UserModel> _localDataBaseServices;

  AuthLocaldataSourceImpl(this._localDataBaseServices);
  @override
  Future<void> saveUserData({required UserModel userData}) async {
    await _localDataBaseServices.addDataWithKey(
      key: userData.uid,
      data: userData,
    );
  }

  @override
  UserModel? getUserData() {
    return _localDataBaseServices.getAllData()?.first;
  }
}
