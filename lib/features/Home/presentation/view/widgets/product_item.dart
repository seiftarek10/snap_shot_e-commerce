import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/assets.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/features/Home/presentation/view/widgets/favorite_icon.dart';
import 'package:snap_shot/features/Home/presentation/view/widgets/shopping_bag_icon.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.green,
        image: const DecorationImage(
          image: AssetImage(Assets.imagesPngOnboardingimage1),
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          const FavoriteIcon(isFavorite: true),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('Jaket', style: AppTextStyle.instance.text14W500Black),
                  Text(
                    r'$ 100',
                    style: AppTextStyle.instance.text16W400.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const ShoppingBagIcon(inCart: true),
            ],
          ),
        ],
      ),
    );
  }
}
