import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/features/owner_home/presentation/model/monthly_rate.dart';

class BarChartGraph extends StatelessWidget {
  final List<MonthlyRate> data;

  const BarChartGraph({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        maxY: _getMaxY(),
        alignment: BarChartAlignment.spaceEvenly,
        titlesData: _titlesData(),
        barGroups: _buildGroups(),

        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          drawHorizontalLine: true,
          horizontalInterval: 2,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.blueGrey.withValues(alpha: 0.15),
              strokeWidth: 0.8,
              dashArray: [4, 4],
            );
          },
        ),

        borderData: FlBorderData(
          show: true,
          border: Border(
            left: BorderSide(
              color: Colors.blueGrey.withValues(alpha: 0.3),
              width: 1,
            ),
            bottom: BorderSide(
              color: Colors.blueGrey.withValues(alpha: 0.3),
              width: 1,
            ),
            top: BorderSide.none,
            right: BorderSide.none,
          ),
        ),
      ),
    );
  }

  double _getMaxY() {
    if (data.isEmpty) return 0;
    final max = data.map((e) => e.value).reduce((a, b) => a > b ? a : b);
    return max + 2;
  }

  List<BarChartGroupData> _buildGroups() {
    return List.generate(data.length, (index) {
      final item = data[index];

      return BarChartGroupData(
        x: index + 1,
        barRods: [
          BarChartRodData(
            toY: item.value,
            width: 14.w,
            color: getBarColor(index, data),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.r),
              topRight: Radius.circular(4.r),
            ),
          ),
        ],
      );
    });
  }

  FlTitlesData _titlesData() {
    return FlTitlesData(
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),

      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 24.w,
          interval: 2,
          getTitlesWidget: (value, meta) {
            return SideTitleWidget(
              meta: meta,
              space: 6
                  .w, // Added slightly more space so text doesn't touch the new border line
              child: Text(
                value.toInt().toString(),
                style: AppTextStyle.instance.text12W500Black.copyWith(
                  color: AppColors.instance.grey,
                ),
              ),
            );
          },
        ),
      ),

      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 32.h,
          interval: 1,
          getTitlesWidget: (value, meta) {
            final index = value.toInt() - 1;

            if (index < 0 || index >= data.length) {
              return const SizedBox();
            }

            return SideTitleWidget(
              meta: meta,
              space: 8.h,
              child: Text(
                data[index].month,
                style: AppTextStyle.instance.text12W500Black.copyWith(
                  fontSize: 10.sp,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Color getBarColor(int index, List<MonthlyRate> data) {
  if (index == 0) return AppColors.instance.black;

  final current = data[index].value;
  final previous = data[index - 1].value;

  if (current > previous) return AppColors.instance.green;
  if (current < previous) return Colors.red;
  return Colors.orange;
}
