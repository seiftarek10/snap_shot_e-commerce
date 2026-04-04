import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/features/orders/presentation/view/widgets/order_state.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.instance.grey, width: 1),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OrderState(currentState: CurrentOrderState.confirmed),
          AppSpace.instance.v12,
          Text(
            "#Product Name",
            style: AppTextStyle.instance.text12W500.copyWith(
              color: AppColors.instance.grey,
            ),
          ),
          AppSpace.instance.v12,
          Text(
            r"$ Product Price",
            style: AppTextStyle.instance.text14WBoldBlack,
          ),
          AppSpace.instance.v12,
          Text(
            "Order At 2025 : 4,30 PM",
            style: AppTextStyle.instance.text12W500.copyWith(
              color: AppColors.instance.grey,
            ),
          ),
        ],
      ),
    );
  }
}
