import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/entites/order_entity.dart';
import 'package:snap_shot/features/orders/presentation/view/widgets/order_details/product_info_container.dart';
import 'package:snap_shot/features/orders/presentation/view/widgets/order_details/products_list_in_order.dart';
import 'package:snap_shot/features/orders/presentation/view/widgets/order_details/user_info_container.dart';
import 'package:snap_shot/shared/widgets/page_header.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key, required this.order});

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: PagePadding(
            child: Column(
              children: [
                AppSpace.instance.topPageSpace,
                const PageHeader(pageTitle: 'Order Details', arrowBack: true),
                AppSpace.instance.v12,
                ProductsListInOrder(products: order.products),
                AppSpace.instance.v12,
                UserInfoContainer(user: order.userData!),
                AppSpace.instance.v20,
                ProductInfoContainer(
                  numberOfProducts: order.products.length.toString(),
                  productsCost: order.productsCost.toString(),
                  deliveryCost: order.deliveryCost.toString(),
                  isPaid: order.isPaid,
                ),
                AppSpace.instance.v20,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
