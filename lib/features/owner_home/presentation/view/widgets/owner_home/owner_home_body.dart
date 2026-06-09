import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/features/owner_home/presentation/manager/stats_cubit/get_stats_data_cubit.dart';
import 'package:snap_shot/features/owner_home/presentation/view/widgets/owner_home/bar_chart/bar_chart_lables.dart';
import 'package:snap_shot/features/owner_home/presentation/view/widgets/owner_home/bar_chart/graph_builder.dart';
import 'package:snap_shot/features/owner_home/presentation/view/widgets/owner_home/owenr_statistic_section.dart';
import 'package:snap_shot/shared/widgets/page_header.dart';
import 'package:snap_shot/shared/widgets/stete_widgets/app_error_widget.dart';

class OwnerHomeBody extends StatelessWidget {
  const OwnerHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetStatsDataCubit, GetStatsDataState>(
      buildWhen: ((previous, current) {
        return current is GetStatsDataSuccess ||
            current is GetStatsDataLoading ||
            current is GetStatsDataFailure;
      }),
      builder: (context, state) {
        if (state is GetStatsDataSuccess) {
          return Column(
            children: [
              AppSpace.instance.topPageSpace,
              const AppPageTitle(pageTitle: 'Home Screen', arrowBack: false),
              AppSpace.instance.v16,
              OwnerStatisticContainers(data: state.data),
              AppSpace.instance.v12,
              const BarChartLables(),
              AppSpace.instance.v12,
              const OwnerHomeGraphBuilder(),
            ],
          );
        } else if (state is GetStatsDataFailure) {
          return Center(
            child: AppErrorWidget(
              errMessage: state.errMessage,
              onTap: () async {
                await context.read<GetStatsDataCubit>().getStatsData();
              },
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(color: AppColors.instance.black),
          );
        }
      },
    );
  }
}
