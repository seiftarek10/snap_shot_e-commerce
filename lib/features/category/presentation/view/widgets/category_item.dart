
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/assets.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
    
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColors.instance.grey),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1.3,
              child: Image.asset(
                Assets.imagesPngOnboardingimage2,
                fit: BoxFit.fill,
              ),
            ),
          ),
          AppSpace.instance.h8,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
    
              children: [
                Text(
                  'Tables',
                  style: AppTextStyle.instance.text20W500.copyWith(
                    color: AppColors.instance.black,
                    fontWeight: FontWeight.w600
                  ),
                ),
                AppSpace.instance.v4,
                Text(
                  '10k Products',
                  style: AppTextStyle.instance.text14W500Black.copyWith(
                    color: AppColors.instance.grey,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: AlignmentGeometry.bottomRight,
              child: InkWell(
                onTap: () {},
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20.h,
                  color: AppColors.instance.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
