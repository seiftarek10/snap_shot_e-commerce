import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/features/home/presentation/view/widgets/owner_widgets/owner_container_statistic.dart';

class OwnerStatisticContainers extends StatelessWidget {
  const OwnerStatisticContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              child: OwnerContainerStatistic(
                lable: 'Total Orders',
                value: '1009',
              ),
            ),
            AppSpace.instance.h12,
            const Expanded(
              child: OwnerContainerStatistic(
                lable: 'Total Users',
                value: '1,000',
              ),
            ),
          ],
        ),
        AppSpace.instance.v12,
        Row(
          children: [
            const Expanded(
              child: OwnerContainerStatistic(
                lable: 'Total Revenue',
                value: '\$50,000',
              ),
            ),
            AppSpace.instance.h12,

            const Expanded(
              child: OwnerContainerStatistic(
                lable: 'Total Products',
                value: '500',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
