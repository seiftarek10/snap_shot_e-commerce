import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:snap_shot/core/entites/order_entity.dart';
import 'package:snap_shot/core/routing/routes.dart';
import 'package:snap_shot/features/orders/presentation/view/widgets/order_item.dart';

class AllOrdersList extends StatelessWidget {
  const AllOrdersList({
    super.key,
    required this.enableLoadingState,
    required this.orders,
  });
  final bool enableLoadingState;
  final List<OrderEntity> orders;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enableLoadingState,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: orders.length,
        itemBuilder: (cotext, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: InkWell(
              onTap: () {
                context.push(
                  Routes.instance.orderDetails,
                  extra: orders[index],
                );
              },
              child: OrderItem(
                order: orders[index],
                enabled: enableLoadingState,
              ),
            ),
          );
        },
      ),
    );
  }
}
