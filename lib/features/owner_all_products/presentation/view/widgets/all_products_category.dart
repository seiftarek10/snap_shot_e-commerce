import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/core/shared_managers/get_products_cubit/get_all_products_cubit.dart';
import 'package:snap_shot/features/owner_all_products/presentation/view/widgets/category_product_item.dart';

class OwnerAllProductsCategory extends StatelessWidget {
  const OwnerAllProductsCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
      builder: (context, state) {
        if (state is GetProductsSuccess) {
          return SliverList.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return OwnerCategoryProductItem(product: state.products[index]);
            },
          );
        } else {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
