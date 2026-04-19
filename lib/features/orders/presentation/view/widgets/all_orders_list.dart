import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_shot/core/routing/routes.dart';
import 'package:snap_shot/features/orders/presentation/view/widgets/order_item.dart';

class AllOrdersList extends StatelessWidget {
  const AllOrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (cotext, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: InkWell(
            onTap: () {
              context.push(Routes.instance.orderDetails);
            },
            child: const OrderItem(),
          ),
        );
      },
    );
  }
}
