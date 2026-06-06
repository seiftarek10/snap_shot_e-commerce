import 'package:snap_shot/core/data_source/remote_data_source/services/fire_base/collection_path.dart';
import 'package:snap_shot/core/data_source/remote_data_source/services/service_interface.dart';
import 'package:snap_shot/core/models/stats_model.dart';
import 'package:snap_shot/features/owner_home/data/data_source/remote_data_source/owner_home_remote.dart';

class OwnerHomeRemoteImpl implements OwnerHomeRemoteDataSource {
  final IRemoteDataBaseServices _dataBaseServices;

  OwnerHomeRemoteImpl(this._dataBaseServices);
  @override
  Future<StatsModel> getStatsData() async {
    final response = await _dataBaseServices.getById(
      collection: CollectionPath.instance.statsData,
      id: "1",
    );

    StatsModel data = StatsModel.fromJson(response);
    return data;
  }
}
