import 'package:flutter/material.dart';
import 'package:snap_shot/features/category/presentation/view/widgets/category_product_item.dart';

class AllProductsCategory extends StatelessWidget {
  const AllProductsCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 20,
      itemBuilder: (context, index) {
        return const CategoryProductItem();
      },
    );
  }
}
