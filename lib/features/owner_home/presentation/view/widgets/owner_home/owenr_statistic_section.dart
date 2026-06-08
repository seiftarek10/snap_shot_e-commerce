import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/routing/routes.dart';
import 'package:snap_shot/features/owner_home/domain/entites/stats_entity.dart';
import 'package:snap_shot/features/owner_home/presentation/view/widgets/owner_home/owner_container_statistic.dart';

class OwnerStatisticContainers extends StatelessWidget {
  const OwnerStatisticContainers({super.key, required this.data});
  final StatsEntity data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: OwnerContainerStatistic(
                lable: 'Total Orders',
                value: data.totalOrders.total.toString(),
              ),
            ),
            AppSpace.instance.h12,
            Expanded(
              child: GestureDetector(
                onTap: () {
                  context.push(Routes.instance.allUsersView);
                },
                child: OwnerContainerStatistic(
                  lable: 'Total Users',
                  value: data.totalUsers.total.toString(),
                ),
              ),
            ),
          ],
        ),
        AppSpace.instance.v12,
        Row(
          children: [
            Expanded(
              child: OwnerContainerStatistic(
                lable: 'Total Products',
                value: data.totalProducts.toString(),
              ),
            ),
            AppSpace.instance.h12,

            Expanded(
              child: OwnerContainerStatistic(
                lable: 'Revenue',
                value: data.revenue.toString(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
