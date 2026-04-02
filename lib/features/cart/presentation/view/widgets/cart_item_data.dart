import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class CartItemData extends StatelessWidget {
  const CartItemData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: Text(
            "Essential Bag",
            style: AppTextStyle.instance.text14WBoldBlack,
          ),
        ),
        Expanded(
          flex: 3,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Rating",
                style: AppTextStyle.instance.text14W500Black.copyWith(
                  color: AppColors.instance.grey,
                ),
              ),
              Icon(Icons.star, color: AppColors.instance.blueGrey, size: 40),
            ],
          ),
        ),
        AppSpace.instance.v12,
        Expanded(
          flex: 3,
          child: Container(
            // margin:  EdgeInsets.(horizontal: 10.w),
            decoration: BoxDecoration(
              color: AppColors.instance.lighterGrey.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(70.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: Icon(Icons.add, size: 16.h),
                ),
                Text("1", style: AppTextStyle.instance.text14W500Black),
                InkWell(
                  onTap: () {},
                  child: Icon(Icons.remove, size: 16.h),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(r"$385.00", style: AppTextStyle.instance.text18W700),
          ),
        ),
      ],
    );
  }
}
