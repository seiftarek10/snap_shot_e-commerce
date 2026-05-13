import 'package:snap_shot/core/data_source/local_data_source/local_data_base_interface.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/features/checkout/data/data_source/local/checkout_local_data_source.dart';

class CheckoutLocalDataSourceImpl implements CheckoutLocalDataSource {
  final ILocalDataBaseServices<UserModel> _userbox;

  CheckoutLocalDataSourceImpl(this._userbox);
  @override
  String? getUserid() {
    return _userbox.getAllData()?.first.uid;
  }

  @override
  UserModel? getUserData()  {
    return _userbox.getAllData()?.first;
  }
}
