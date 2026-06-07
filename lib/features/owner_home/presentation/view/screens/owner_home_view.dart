import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/core/di/sl.dart';
import 'package:snap_shot/features/owner_home/presentation/manager/stats_cubit/get_stats_data_cubit.dart';
import 'package:snap_shot/features/owner_home/presentation/view/widgets/owner_home/owner_home_body.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';

class OwnerHomeView extends StatelessWidget {
  const OwnerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetStatsDataCubit>()..getStatsData(),
      child: const Scaffold(
        body: SafeArea(
          child: PagePadding(
            child: OwnerHomeBody()
          ),
        ),
      ),
    );
  }
}
