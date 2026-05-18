import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class PriceSummeryItem extends StatelessWidget {
  const PriceSummeryItem({super.key, required this.label, required this.value});

  final String label, value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(label, style: AppTextStyle.instance.text18W300),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(value, style: AppTextStyle.instance.text18W300),
              ),
            ),
          ],
        ),
        AppSpace.instance.v8,
        DottedLine(
          dashColor: AppColors.instance.grey,
          lineThickness: 1,
          dashLength: 20,
          dashGapLength: 10,
        ),
      ],
    );
  }
}
