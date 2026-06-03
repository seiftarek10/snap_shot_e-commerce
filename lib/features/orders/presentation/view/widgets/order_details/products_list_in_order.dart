import 'package:flutter/material.dart';
import 'package:snap_shot/core/shared_domain_data/all_products/domain/entity/product_entity.dart';
import 'package:snap_shot/features/orders/presentation/view/widgets/order_details/product_details_in_order.dart';

class ProductsListInOrder extends StatelessWidget {
  const ProductsListInOrder({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: ProductDetailsInOrder(productEntity: products[index]),
        );
      },
    );
  }
}
