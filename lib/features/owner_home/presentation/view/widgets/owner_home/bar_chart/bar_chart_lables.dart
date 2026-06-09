import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/features/owner_home/presentation/manager/stats_cubit/get_stats_data_cubit.dart';

class BarChartLables extends StatefulWidget {
  const BarChartLables({super.key});

  @override
  State<BarChartLables> createState() => _BarChartLablesState();
}

class _BarChartLablesState extends State<BarChartLables> {
  int currentIndex = 0;
  List<String> labels = ['Users', 'Orders'];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(labels.length, (index) {
        return TextButton(
          onPressed: () {
            setState(() {
              currentIndex = index;
            });
            context.read<GetStatsDataCubit>().changeGraphData(
              currentIndex == 0,
            );
          },
          child: Text(
            labels[index],
            style: AppTextStyle.instance.text18W700.copyWith(
              color: index == currentIndex
                  ? AppColors.instance.black
                  : AppColors.instance.grey,
            ),
          ),
        );
      }),
    );
  }
}
