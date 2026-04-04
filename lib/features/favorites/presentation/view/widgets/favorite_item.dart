import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/assets.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/shared/widgets/favorite_icon.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key});

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
            child: Image.asset(
              Assets.imagesPngOnboardingimage2,
              fit: BoxFit.fill,
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
                          "#Product Name",
                          overflow: TextOverflow.ellipsis,

                          style: AppTextStyle.instance.text14W500Black,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "#Product Category",
                          overflow: TextOverflow.ellipsis,

                          style: AppTextStyle.instance.text12W500.copyWith(
                            color: AppColors.instance.grey,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "#Product Price",
                          style: AppTextStyle.instance.text16W600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: FavoriteIcon(isFavorite: true),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
