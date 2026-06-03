import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/di/sl.dart';
import 'package:snap_shot/features/owner_home/presentation/manager/cubit/get_all_users_cubit.dart';
import 'package:snap_shot/features/owner_home/presentation/view/widgets/owner_widgets/bar_chart/bar_chart_graph.dart';
import 'package:snap_shot/features/owner_home/presentation/view/widgets/owner_widgets/bar_chart/bar_chart_lables.dart';
import 'package:snap_shot/features/owner_home/presentation/view/widgets/owner_widgets/owenr_statistic_section.dart';
import 'package:snap_shot/shared/widgets/page_header.dart';

import 'package:snap_shot/shared/widgets/page_padding.dart';

class OwnerHomeView extends StatelessWidget {
  const OwnerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetAllUsersCubit>()..getAllUsers(),
      child: Scaffold(
        body: SafeArea(
          child: PagePadding(
            child: Column(
              children: [
                AppSpace.instance.topPageSpace,
                const PageHeader(pageTitle: 'Home Screen', arrowBack: false),
                AppSpace.instance.v16,
                const OwnerStatisticContainers(),
                AppSpace.instance.v12,
                const BarChartLables(),
                AppSpace.instance.v12,
                Expanded(
                  child: BarChartGraph(
                    data: [
                      MonthlyRate(month: 'jan', value: 10),
                      MonthlyRate(month: 'fab', value: 30),
                      MonthlyRate(month: 'mar', value: 70),
                      MonthlyRate(month: 'apr', value: 40),
                      MonthlyRate(month: 'may', value: 60),
                      MonthlyRate(month: 'jun', value: 100),
                      MonthlyRate(month: 'jul', value: 90),
                      MonthlyRate(month: 'aug', value: 120),
                      MonthlyRate(month: 'sep', value: 20),
                      MonthlyRate(month: 'oct', value: 20),
                      MonthlyRate(month: 'nov', value: 10),
                      MonthlyRate(month: 'dec', value: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
