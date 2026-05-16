import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/shared/widgets/page_header.dart';
import 'package:snap_shot/features/orders/presentation/view/widgets/all_orders_list.dart';
import 'package:snap_shot/features/orders/presentation/view/widgets/current_history_orders.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';

class UserOrdersView extends StatelessWidget {
  const UserOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return PagePadding(
      child: Column(
        children: [
          AppSpace.instance.topPageSpace,
          const PageHeader(pageTitle: 'Orders', arrowBack: false),
          AppSpace.instance.v12,
          const OrderStatusIndicator(lables: ['Current', 'History']),
          AppSpace.instance.v12,
          const Expanded(child: AllOrdersList()),
        ],
      ),
    );
  }
}
