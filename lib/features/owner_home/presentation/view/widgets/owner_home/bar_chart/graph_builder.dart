import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/features/owner_home/presentation/manager/stats_cubit/get_stats_data_cubit.dart';
import 'package:snap_shot/features/owner_home/presentation/view/widgets/owner_home/bar_chart/bar_chart_graph.dart';

class OwnerHomeGraphBuilder extends StatelessWidget {
  const OwnerHomeGraphBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<GetStatsDataCubit, GetStatsDataState>(
        buildWhen: (pervious, current) {
          return current is ChangeGraphData;
        },
        builder: (context, state) {
          if (state is ChangeGraphData) {
            return BarChartGraph(data: state.data);
          } else {
            return BarChartGraph(
              data: context.read<GetStatsDataCubit>().allUsers ?? [],
            );
          }
        },
      ),
    );
  }
}
