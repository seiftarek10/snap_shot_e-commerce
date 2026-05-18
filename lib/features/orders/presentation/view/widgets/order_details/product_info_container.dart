import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/features/orders/presentation/view/models/order_details_container_item_model.dart';
import 'package:snap_shot/features/orders/presentation/view/widgets/order_details/order_details_conteainer.dart';

class ProductInfoContainer extends StatelessWidget {
  const ProductInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Product Info', style: AppTextStyle.instance.text20Bold),
        AppSpace.instance.v8,
        OrderDetailsContainer(
          containerData: [
            OrderDetailsContainerItemModel(
              label: 'product',
              value: 'Glasses',
              icon: Icons.inventory_2_outlined,
            ),
            OrderDetailsContainerItemModel(
              label: 'Quantity',
              value: '3',
              icon: Icons.workspaces_outlined,
            ),
            OrderDetailsContainerItemModel(
              label: 'Price for Item',
              value: r'$ 200',
              icon: Icons.money_rounded,
            ),
            OrderDetailsContainerItemModel(
              label: 'Total Price',
              value: r'$ 1000',
              icon: Icons.paid_outlined,
            ),
          ],
        ),
      ],
    );
  }
}
