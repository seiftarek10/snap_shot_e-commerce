import 'package:snap_shot/core/use_case/general_use_case.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/owner_home/domain/entites/stats_entity.dart';
import 'package:snap_shot/features/owner_home/domain/repos/owner_home_repo.dart';

class GetStatsDataUseCase extends FutureUseCase<StatsEntity, void> {
  final OwnerHomeRepo _homeRepo;

  GetStatsDataUseCase(this._homeRepo);
  @override
  Future<Result<StatsEntity>> call(void param) async {
    return await _homeRepo.getStatsData();
  }
}
