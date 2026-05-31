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
            const Expanded(child: OwnerContainerStatistic()),
            AppSpace.instance.h12,
            const Expanded(child: OwnerContainerStatistic()),
          ],
        ),
        AppSpace.instance.v12,
        Row(
          children: [
            const Expanded(child: OwnerContainerStatistic()),
            AppSpace.instance.h12,

            const Expanded(child: OwnerContainerStatistic()),
          ],
        ),
      ],
    );
  }
}
