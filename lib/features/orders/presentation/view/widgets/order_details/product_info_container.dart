import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/features/orders/presentation/view/models/order_details_container_item_model.dart';
import 'package:snap_shot/features/orders/presentation/view/widgets/order_details/order_details_conteainer.dart';

class ProductInfoContainer extends StatelessWidget {
  const ProductInfoContainer({
    super.key,
    required this.numberOfProducts,
    required this.productsCost,
    required this.deliveryCost,
    required this.isPaid,
  });
  final String numberOfProducts;
  final String productsCost;
  final String deliveryCost;
  final bool isPaid;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Paid',
              style: AppTextStyle.instance.text20Bold.copyWith(
                color: isPaid ? Colors.green : Colors.red,
              ),
            ),
            AppSpace.instance.h4,
            Icon(
              isPaid ? Icons.check_circle_outline : Icons.cancel_outlined,
              size: 20.h,
              color: isPaid ? Colors.green : Colors.red,
            ),
          ],
        ),
        AppSpace.instance.v8,
        OrderDetailsContainer(
          containerData: [
            OrderDetailsContainerItemModel(
              label: 'Number Of Products',
              value: numberOfProducts,
              icon: Icons.money_rounded,
            ),
            OrderDetailsContainerItemModel(
              label: 'ProductsCost',
              value: productsCost,
              icon: Icons.money_rounded,
            ),
            OrderDetailsContainerItemModel(
              label: 'Delivery Cost',
              value: deliveryCost,
              icon: Icons.money_rounded,
            ),
            OrderDetailsContainerItemModel(
              label: 'Total Cost',
              value:
                  r'$'
                  '${(double.parse(productsCost) + double.parse(deliveryCost)).toString()}',
              icon: Icons.paid_outlined,
            ),
          ],
        ),
      ],
    );
  }
}
