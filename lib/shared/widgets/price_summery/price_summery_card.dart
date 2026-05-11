import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/shared/widgets/price_summery/price_summery_item.dart';

class PriceSummeryCard extends StatelessWidget {
  const PriceSummeryCard({
    super.key,
    required this.deliveryCost,
    required this.totalCost,
    required this.productsCost,
  });
  final double deliveryCost, totalCost, productsCost;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PriceSummeryItem(
          label: 'Cost',
          value:
              r'$ '
              '$productsCost',
        ),
        AppSpace.instance.v12,
        PriceSummeryItem(
          label: 'Delivery',
          value:
              r'$ '
              '$deliveryCost',
        ),
        AppSpace.instance.v20,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total', style: AppTextStyle.instance.text22Bold),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  r'$ '
                  '$totalCost',
                  style: AppTextStyle.instance.text22Bold,
                ),
              ),
            ),
          ],
        ),
        AppSpace.instance.v20,
      ],
    );
  }
}
