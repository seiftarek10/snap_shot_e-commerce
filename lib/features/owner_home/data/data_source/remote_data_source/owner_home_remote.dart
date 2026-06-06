import 'package:snap_shot/core/models/stats_model.dart';

abstract class OwnerHomeRemoteDataSource {
  Future<StatsModel> getStatsData();
}
