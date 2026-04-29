import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';
import 'package:snap_shot/features/home/presentation/view/widgets/user_widgets/user_shopping_bag_icon.dart';
import 'package:snap_shot/shared/widgets/favorite_icon.dart';

class UserHomeProductItem extends StatelessWidget {
  const UserHomeProductItem({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FavoriteIcon(isFavorite: true),
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
            const UserShoppingBagIcon(inCart: true),
          ],
        ),
      ],
    );
  
  
  }
}
