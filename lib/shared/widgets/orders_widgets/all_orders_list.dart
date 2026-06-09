import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:snap_shot/core/entites/order_entity.dart';
import 'package:snap_shot/core/routing/app_router.dart';
import 'package:snap_shot/core/routing/routes.dart';
import 'package:snap_shot/features/order_details/presentation/view/screens/order_details_view.dart';
import 'package:snap_shot/shared/widgets/orders_widgets/order_item.dart';

class AllOrdersList extends StatelessWidget {
  const AllOrdersList({
    super.key,
    required this.enableLoadingState,
    required this.orders,
    required this.role,
    required this.isConfirmedList,
  });
  final bool enableLoadingState;
  final List<OrderEntity> orders;
  final Role role;
  final bool isConfirmedList;
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
                  extra: OrderDetailsExtraInputModel(
                    order: orders[index],
                    role: role,
                    isConfirmed: isConfirmedList,
                  ),
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
