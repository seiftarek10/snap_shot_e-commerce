import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class CategoryItemContainer extends StatelessWidget {
  const CategoryItemContainer({
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
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h), 
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected
              ? AppColors.instance.black
              : AppColors.instance.grey,
          width: 1.5,
        ),
        color: isSelected ? AppColors.instance.black : Colors.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      
      child: Row(
        mainAxisSize: MainAxisSize.min, 
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyle.instance.text14WBoldBlack.copyWith(
              color: isSelected
                  ? AppColors.instance.white
                  : AppColors.instance.darkGrey,
            ),
          ),
        ],
      ),
    );
  }
}