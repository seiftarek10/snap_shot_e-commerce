import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/shared_domain_data/all_products/domain/entity/product_entity.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/features/cart/presentation/manager/cart_cubit/user_cart_manager_cubit.dart';
import 'package:snap_shot/features/favorites/presentation/managers/get_fav_products/get_favorites_products_cubit.dart';
import 'package:snap_shot/core/shared_managers/get_products_cubit/get_all_products_cubit.dart';
import 'package:snap_shot/features/user_home/presentation/view/widgets/user_widgets/user_shopping_bag_icon.dart';
import 'package:snap_shot/shared/widgets/favorite_icon.dart';

class UserHomeProductItem extends StatelessWidget {
  const UserHomeProductItem({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      product.rate,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.instance.text14W500Black,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.star, color: Colors.amber, size: 20.h),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: FavoriteIcon(
                  key: ValueKey('fav_${product.id}_${product.isFav}'),
                  isFavorite: product.isFav ?? false,
                  onTap: () async {
                    final productsCubit = context.read<GetAllProductsCubit>();

                    final favCubit = context.read<FavoritesProductsCubit>();
                    await favCubit.toggleFavProduct(
                      isFav: product.isFav ?? false,
                      product: product,
                    );
                    await productsCubit.getAllProducts(loadingState: false);
                  },
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: AspectRatio(
            aspectRatio: 1.1,
            child: CachedNetworkImage(
              imageUrl: product.imageUrl,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) =>
                  Icon(Icons.error, size: 10.h),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: AppTextStyle.instance.text14W500Black,
                  ),
                  Text(
                    r'$'
                    '${product.price}',
                    style: AppTextStyle.instance.text16W400.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            UserShoppingBagIcon(
              inCart: product.inCart ?? false,
              onTap: () async {
                final productsCubit = context.read<GetAllProductsCubit>();

                final cartCubit = context.read<UserCartManegerCubit>();
                await cartCubit.toggleCartProdcut(
                  inCart: product.inCart ?? false,
                  product: product,
                );
                await productsCubit.getAllProducts(loadingState: false);
              },
            ),
          ],
        ),
      ],
    );
  }
}
