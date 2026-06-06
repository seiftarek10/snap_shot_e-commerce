import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/features/owner_home/domain/entites/stats_entity.dart';
import 'package:snap_shot/features/owner_home/presentation/manager/stats_cubit/get_stats_data_cubit.dart';
import 'package:snap_shot/features/owner_home/presentation/view/widgets/owner_home/owenr_statistic_section.dart';
import 'package:snap_shot/shared/widgets/stete_widgets/app_error_widget.dart';
import 'package:snap_shot/shared/widgets/stete_widgets/app_loading_widget.dart';

class StatsSectionBuilder extends StatelessWidget {
  const StatsSectionBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetStatsDataCubit, GetStatsDataState>(
      builder: (context, state) {
        if (state is GetStatsDataSuccess) {
          return OwnerStatisticContainers(data: state.data);
        } else if (state is GetStatsDataFailure) {
          return AppErrorWidget(
            errMessage: state.errMessage,
            onTap: () async {
              await context.read<GetStatsDataCubit>().getStatsData();
            },
          );
        } else {
          return const AppLoadingWidget(
            child: OwnerStatisticContainers(
              data: StatsEntity(
                totalUsers: StatsDetailsEntity(total: 0, monthlyHistory: {}),
                totalOrders: StatsDetailsEntity(total: 0, monthlyHistory: {}),
                totalProducts: 0,
                revenue: 0,
              ),
            ),
          );
        }
      },
    );
  }
}
