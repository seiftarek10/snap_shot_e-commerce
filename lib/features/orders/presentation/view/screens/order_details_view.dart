import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/assets.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/features/orders/data/models/order_details_container_item_model.dart';
import 'package:snap_shot/features/orders/presentation/view/widgets/order_details/order_details_conteainer.dart';
import 'package:snap_shot/features/orders/presentation/view/widgets/order_details/order_details_product_image.dart';
import 'package:snap_shot/features/orders/presentation/view/widgets/order_details/product_info_container.dart';
import 'package:snap_shot/features/orders/presentation/view/widgets/order_details/user_info_container.dart';
import 'package:snap_shot/shared/widgets/page_header.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

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
                const OrderDetailsProductImage(
                  productImage: Assets.imagesPngOnboardingimage2,
                ),
                AppSpace.instance.v12,
                const UserInfoContainer(),
                AppSpace.instance.v20,
                const ProductInfoContainer(),
                AppSpace.instance.v20,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
