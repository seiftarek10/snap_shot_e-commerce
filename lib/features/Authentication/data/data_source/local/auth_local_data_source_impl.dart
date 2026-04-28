import 'package:snap_shot/core/data_source/local_data_source/local_data_base_interface.dart';
import 'package:snap_shot/core/entites/user_entity.dart';
import 'package:snap_shot/features/authentication/data/data_source/auth_local_data_source.dart';

class AuthLocaldataSourceImpl extends AuthLocalDataSource {
  final ILocalDataBaseServices<UserEntity> _localDataBaseServices;

  AuthLocaldataSourceImpl(this._localDataBaseServices);
  @override
  Future<void> saveUserData({ required UserEntity userData}) async {
    await _localDataBaseServices.addDataWithKey(
      key: userData.uid,
      data: userData,
    );
  }


}
