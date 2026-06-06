import 'package:meta/meta.dart';
import 'package:snap_shot/core/bloc/base_cubit.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/owner_home/domain/entites/stats_entity.dart';
import 'package:snap_shot/features/owner_home/domain/use_cases/get_stats_data_use_case.dart';

part 'get_stats_data_state.dart';

class GetStatsDataCubit extends BaseCubit<GetStatsDataState> {
  GetStatsDataCubit(this._useCase) : super(const GetStatsDataInitial());

  final GetStatsDataUseCase _useCase;

  Future<void> getStatsData() async {
    safeEmit(const GetStatsDataLoading());
    final result = await _useCase.call(null);
    if (result is Success<StatsEntity>) {
      safeEmit(GetStatsDataSuccess(result.data));
    }
    if (result is AppFailure<StatsEntity>) {
      safeEmit(GetStatsDataFailure(result.failure.errMessage));
    }
  }
}
