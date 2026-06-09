import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/entites/order_entity.dart';
import 'package:snap_shot/core/routing/app_router.dart';
import 'package:snap_shot/features/order_details/presentation/view/widgets/order_details_owner_action_button.dart';
import 'package:snap_shot/features/order_details/presentation/view/widgets/product_info_container.dart';
import 'package:snap_shot/features/order_details/presentation/view/widgets/products_list_in_order.dart';
import 'package:snap_shot/features/order_details/presentation/view/widgets/user_info_container.dart';
import 'package:snap_shot/shared/widgets/page_header.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key, required this.inputModel});

  final OrderDetailsExtraInputModel inputModel;

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
                const AppPageTitle(pageTitle: 'Order Details', arrowBack: true),
                AppSpace.instance.v12,
                ProductsListInOrder(products: inputModel.order.products),
                AppSpace.instance.v12,
                UserInfoContainer(user: inputModel.order.userData!),
                AppSpace.instance.v20,
                ProductInfoContainer(
                  numberOfProducts: inputModel.order.products.length.toString(),
                  productsCost: inputModel.order.productsCost.toString(),
                  deliveryCost: inputModel.order.deliveryCost.toString(),
                  isPaid: inputModel.order.isPaid,
                ),
                AppSpace.instance.v20,
                inputModel.role == Role.owner
                    ? ActionButtons(
                        order: inputModel.order,
                        isConfirmedOrder: inputModel.isConfirmed,
                      )
                    : const SizedBox.shrink(),
                inputModel.role == Role.owner
                    ? AppSpace.instance.v20
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OrderDetailsExtraInputModel {
  final OrderEntity order;
  final Role role;
  final bool isConfirmed;

  OrderDetailsExtraInputModel({
    required this.order,
    required this.role,
    required this.isConfirmed,
  });
}
