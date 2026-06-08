import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/owner_home/domain/entites/stats_entity.dart';

abstract class OwnerHomeRepo {
  Future<Result<StatsEntity>> getStatsData();
}
