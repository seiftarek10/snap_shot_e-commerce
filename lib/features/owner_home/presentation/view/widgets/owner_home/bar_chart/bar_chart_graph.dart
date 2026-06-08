import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/features/owner_home/presentation/model/monthly_rate.dart';

class BarChartGraph extends StatelessWidget {
  final List<MonthlyRate> data;

  const BarChartGraph({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        maxY: _getMaxY(),
        titlesData: _titlesData(),
        barGroups: _buildGroups(),
      ),
    );
  }

  double _getMaxY() {
    if (data.isEmpty) {
      return 0;
    }
    final max = data.map((e) => e.value).reduce((a, b) => a > b ? a : b);
    return max + 20;
  }

  List<BarChartGroupData> _buildGroups() {
    return List.generate(data.length, (index) {
      final item = data[index];

      return BarChartGroupData(
        x: index + 1,
        barRods: [
          BarChartRodData(
            toY: item.value,
            width: 25,
            color: getBarColor(index, data),
            borderRadius: BorderRadius.circular(6),
          ),
        ],
      );
    });
  }

  FlTitlesData _titlesData() {
    return FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            final index = value.toInt()-1;

            if (index < 0 || index >= data.length) {
              return const SizedBox();
            }

            return Text(data[index].month);
          },
        ),
      ),
      leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
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

