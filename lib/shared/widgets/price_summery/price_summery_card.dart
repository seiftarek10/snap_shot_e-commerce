import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/shared/widgets/price_summery/price_summery_item.dart';

class PriceSummeryCard extends StatelessWidget {
  const PriceSummeryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const PriceSummeryItem(label: 'SubTotal', value: r'$56,43'),
        AppSpace.instance.v12,
        const PriceSummeryItem(label: 'Discount', value: r'$56,43'),
        AppSpace.instance.v12,
        const PriceSummeryItem(label: 'Delivery', value: r'$56,43'),
        AppSpace.instance.v20,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total', style: AppTextStyle.instance.text22Bold),
            Text(r'$ 200,77', style: AppTextStyle.instance.text22Bold),
          ],
        ),
        AppSpace.instance.v20,
      ],
    );
  }
}
