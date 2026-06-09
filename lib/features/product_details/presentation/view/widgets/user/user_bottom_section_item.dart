import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class UserProductDetailsBottomSheetItem extends StatelessWidget {
  const UserProductDetailsBottomSheetItem({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 20.w),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.instance.greyLight, width: 3),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                title,
                style: AppTextStyle.instance.text14W500Black.copyWith(
                  color: AppColors.instance.grey,
                ),
              ),
            ),
            Expanded(
              child: Text(subTitle, style: AppTextStyle.instance.text16W600),
            ),
          ],
        ),
      ),
    );
  }
}
