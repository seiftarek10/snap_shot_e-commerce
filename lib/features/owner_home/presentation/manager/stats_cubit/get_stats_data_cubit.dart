import 'package:meta/meta.dart';
import 'package:snap_shot/core/bloc/base_cubit.dart';
import 'package:snap_shot/core/utils/result.dart';
import 'package:snap_shot/features/owner_home/domain/entites/stats_entity.dart';
import 'package:snap_shot/features/owner_home/domain/use_cases/get_stats_data_use_case.dart';
import 'package:snap_shot/features/owner_home/presentation/model/monthly_rate.dart';

part 'get_stats_data_state.dart';

class GetStatsDataCubit extends BaseCubit<GetStatsDataState> {
  GetStatsDataCubit(this._useCase) : super(const GetStatsDataInitial());

  final GetStatsDataUseCase _useCase;

  StatsEntity? statsData;

  List<MonthlyRate>? allUsers = [];
  List<MonthlyRate>? allOrders = [];

  Future<void> getStatsData() async {
    safeEmit(const GetStatsDataLoading());
    final result = await _useCase.call(null);
    if (result is Success<StatsEntity>) {
      statsData = result.data;

      _getGraphData();
      safeEmit(GetStatsDataSuccess(result.data));
    }
    if (result is AppFailure<StatsEntity>) {
      safeEmit(GetStatsDataFailure(result.failure.errMessage));
    }
  }

  void _getGraphData() {
    allUsers = generateMonthlyRates(statsData?.totalUsers.monthlyHistory ?? {});
    allOrders = generateMonthlyRates(
      statsData?.totalOrders.monthlyHistory ?? {},
    );
  }

  void changeGraphData(bool isUserData) {
    if (isUserData) {
      safeEmit(ChangeGraphData(allUsers ?? []));
    } else {
      safeEmit(ChangeGraphData(allOrders ?? []));
    }
  }
}
