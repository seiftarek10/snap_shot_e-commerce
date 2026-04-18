import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_shot/core/routing/routes.dart';
import 'package:snap_shot/features/category/presentation/view/widgets/category_product_item.dart';

class OwnerAllProductsCategory extends StatelessWidget {
  const OwnerAllProductsCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 20,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            context.push(Routes.instance.productDetails);
          },
          child: const OwnerCategoryProductItem(),
        );
      },
    );
  }
}
