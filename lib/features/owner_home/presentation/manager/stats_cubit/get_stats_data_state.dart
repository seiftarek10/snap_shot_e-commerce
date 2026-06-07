part of 'get_stats_data_cubit.dart';

@immutable
sealed class GetStatsDataState {
  const GetStatsDataState();
}

final class GetStatsDataInitial extends GetStatsDataState {
  const GetStatsDataInitial();
}

final class GetStatsDataLoading extends GetStatsDataState {
  const GetStatsDataLoading();
}

final class GetStatsDataSuccess extends GetStatsDataState {
  const GetStatsDataSuccess(this.data);
  final StatsEntity data;
}

final class GetStatsDataFailure extends GetStatsDataState {
  const GetStatsDataFailure(this.errMessage);
  final String errMessage;
}


final class ChangeGraphData extends GetStatsDataState {
  const ChangeGraphData(this.data);
  final List<MonthlyRate> data;
}



