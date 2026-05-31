import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/features/orders/presentation/view/models/order_details_container_item_model.dart';
import 'package:snap_shot/features/orders/presentation/view/widgets/order_details/order_details_item.dart';

class OrderDetailsContainer extends StatelessWidget {
  const OrderDetailsContainer({super.key, required this.containerData});
  final List<OrderDetailsContainerItemModel> containerData;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: containerData.isEmpty ? null : const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.instance.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [BoxShadow(color: AppColors.instance.grey, blurRadius: 2)],
      ),
      child: Column(
        children: List.generate(containerData.length, (index) {
          return OrderDetailsContainerItem(
            orderItemData: containerData[index],
            isLastIndex: index == containerData.length - 1,
          );
        }),
      ),
    );
  }
}
