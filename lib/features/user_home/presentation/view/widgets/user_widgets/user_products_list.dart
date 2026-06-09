import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_shot/core/routing/routes.dart';
import 'package:snap_shot/core/shared_domain_data/all_products/domain/entity/product_entity.dart';
import 'package:snap_shot/features/cart/presentation/manager/cart_cubit/user_cart_manager_cubit.dart';
import 'package:snap_shot/features/product_details/presentation/model/product_details_extra_model.dart';
import 'package:snap_shot/core/shared_managers/get_products_cubit/get_all_products_cubit.dart';
import 'package:snap_shot/features/user_home/presentation/view/widgets/user_widgets/user_home_product_item.dart';

class UserHomeProductsList extends StatelessWidget {
  const UserHomeProductsList({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12.w,
        crossAxisSpacing: 10.h,
        childAspectRatio: 163 / 217,
      ),
      itemBuilder: (context, index) {
        final getAllProductsCubit = context.read<GetAllProductsCubit>();
        final userHomeCartCubit = context.read<UserCartManegerCubit>();
        return GestureDetector(
          onTap: () {
            context.push(
              Routes.instance.productDetails,
              extra: ProductDetailsExtraModel(
                productEntity: products[index],
                getAllProductsCubit: getAllProductsCubit,
                userHomeCartCubit: userHomeCartCubit,
                fromHomeScreen: true,
              ),
              // extra: products[index],
            );
          },
          child: UserHomeProductItem(
            key: ValueKey(products[index].id),
            product: products[index],
          ),
        );
      },
    );
  }
}
