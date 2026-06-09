import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/features/user_orders/presentation/view/models/order_details_container_item_model.dart';

class OrderDetailsContainerItem extends StatelessWidget {
  const OrderDetailsContainerItem({
    super.key,
    required this.orderItemData,
    required this.isLastIndex,
  });
  final OrderDetailsContainerItemModel orderItemData;
  final bool isLastIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    orderItemData.label,
                    style: AppTextStyle.instance.text14W500Black.copyWith(
                      color: AppColors.instance.darkGrey,
                    ),
                  ),
                  Text(
                    orderItemData.value,
                    style: AppTextStyle.instance.text14WBoldBlack,
                  ),
                ],
              ),
            ),
            AppSpace.instance.h8,
            Icon(orderItemData.icon, size: 25.h),
          ],
        ),
        isLastIndex == false ? Divider(height: 20.h) : const SizedBox.shrink(),
      ],
    );
  }
}
