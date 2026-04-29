import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class UserHomeCategoryItem extends StatelessWidget {
  const UserHomeCategoryItem({
    super.key,
    required this.isSelected,
    required this.title,
  });

  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOutCubicEmphasized,
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected
              ? AppColors.instance.black
              : AppColors.instance.grey,
          width: 1.5,
        ),
        color: isSelected ? AppColors.instance.black : null,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Center(
        child: Text(
          title,
          style: AppTextStyle.instance.text14WBoldBlack.copyWith(
            color: isSelected
                ? AppColors.instance.white
                : AppColors.instance.darkGrey,
          ),
        ),
      ),
    );
  }
}
