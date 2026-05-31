import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/features/favorites/presentation/managers/get_fav_products/get_favorites_products_cubit.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';
import 'package:snap_shot/shared/widgets/favorite_icon.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: AppColors.instance.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.instance.greyLight,
            blurStyle: BlurStyle.solid,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: CachedNetworkImage(
              imageUrl: product.imageUrl,
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          product.name,
                          overflow: TextOverflow.ellipsis,

                          style: AppTextStyle.instance.text14W500Black,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          product.category,
                          overflow: TextOverflow.ellipsis,

                          style: AppTextStyle.instance.text12W500.copyWith(
                            color: AppColors.instance.grey,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          r'$ '
                          '${product.price}',
                          style: AppTextStyle.instance.text16W600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: FavoriteIcon(
                      isFavorite: product.isFav ?? true,
                      onTap: () async {
                        await context
                            .read<FavoritesProductsCubit>()
                            .toggleFavProduct(
                              isFav: product.isFav ?? true,
                              product: product,
                            );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          AppSpace.instance.v8,
        ],
      ),
    );
  }
}
