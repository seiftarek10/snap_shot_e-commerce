import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/assets.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/entites/order_entity.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order, required this.enabled});
  final OrderEntity order;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      decoration: _buildDecoration(),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: AspectRatio(
              aspectRatio: 0.56,
              child: enabled == false
                  ? CachedNetworkImage(
                      imageUrl: order.products.first.imageUrl,
                      fit: BoxFit.fill,
                    )
                  : Image.asset(
                      Assets.imagesPngOnboardingimage1,
                      fit: BoxFit.fill,
                    ),
            ),
          ),
          AppSpace.instance.h16,
          Expanded(
            flex: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const OrderState(currentState: CurrentOrderState.shipped),
                Expanded(
                  flex: 5,
                  child: Text(
                    order.products.map((e) => e.name).join(', '),
                    style: AppTextStyle.instance.text16W400,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      r"$"
                      "${order.productsCost + order.deliveryCost}",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.instance.text14WBoldBlack,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "Order At ${order.createdAt}",
                    style: AppTextStyle.instance.text12W500.copyWith(
                      color: AppColors.instance.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              "${order.products.length}",
              style: AppTextStyle.instance.text18W700,
              textAlign: TextAlign.end,
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
