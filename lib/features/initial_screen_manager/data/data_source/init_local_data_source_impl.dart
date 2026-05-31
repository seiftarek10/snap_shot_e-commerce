import 'package:snap_shot/core/data_source/local_data_source/local_data_base_interface.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/features/initial_screen_manager/data/data_source/init_local_data_source.dart';

class InitAppLocalDataSourceImpl implements InitAppLocalDataSource {
  final ILocalDataBaseServices<UserModel> _useBox;
  final ILocalDataBaseServices<bool> _isFirstTimeBox;

  InitAppLocalDataSourceImpl(this._useBox, this._isFirstTimeBox);
  @override
  Future<bool> isFirstTime() async{
    final result = await _isFirstTimeBox.getData(key: 'FirstTime');
    if (result==null || result == true) {
      return true;
    } else {
      return false;
    }
  }

  @override
  bool isLoggedIn() {
  final userData = _useBox.getAllData();
    if (userData.isEmpty) {
      return false;
    }
    return true;
  }
}
