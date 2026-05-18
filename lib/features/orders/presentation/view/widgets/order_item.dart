import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/entites/order_entity.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/features/orders/presentation/view/widgets/order_state.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order});
  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      decoration: _buildDecoration(),
      child: Row(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 0.56,
              child: CachedNetworkImage(
                imageUrl: order.products.first.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          AppSpace.instance.h16,
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const OrderState(currentState: CurrentOrderState.shipped),
                AppSpace.instance.v12,
                Text(
                  "${order.products[1].name}........}",
                  style: AppTextStyle.instance.text12W500.copyWith(
                    color: AppColors.instance.grey,
                  ),
                ),
                AppSpace.instance.v12,
                Text(
                  r"$"
                  "${order.productsCost}",
                  style: AppTextStyle.instance.text14WBoldBlack,
                ),
                AppSpace.instance.v12,
                Text(
                  "Order At ${order.createdAt}",
                  style: AppTextStyle.instance.text12W500.copyWith(
                    color: AppColors.instance.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      border: Border.all(color: AppColors.instance.greyLight, width: 1),
      borderRadius: BorderRadius.circular(16.r),
      gradient: LinearGradient(
        colors: [
          AppColors.instance.white,
          AppColors.instance.white,
          AppColors.instance.lighterGrey,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      boxShadow: [BoxShadow(color: AppColors.instance.grey, blurRadius: 2)],
    );
  }
}
