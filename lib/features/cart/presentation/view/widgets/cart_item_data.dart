import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/shared_domain_data/all_products/domain/entity/product_entity.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/features/cart/presentation/view/widgets/cart_item_counter.dart';

class CartItemData extends StatelessWidget {
  const CartItemData({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: Text(
            product.name,
            style: AppTextStyle.instance.text14WBoldBlack,
          ),
        ),
        Expanded(
          flex: 3,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                product.rate,
                style: AppTextStyle.instance.text14W500Black.copyWith(
                  color: AppColors.instance.grey,
                ),
              ),
              Icon(Icons.star, color: AppColors.instance.blueGrey, size: 40),
            ],
          ),
        ),
        AppSpace.instance.v12,
        Expanded(flex: 3, child: CartItemCounter(product: product)),
        Expanded(
          flex: 3,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              r"$ "
              "${product.price}",
              style: AppTextStyle.instance.text18W700,
            ),
          ),
        ),
      ],
    );
  }
}
