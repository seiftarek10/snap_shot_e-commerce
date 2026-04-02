import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class FilterItme extends StatefulWidget {
  const FilterItme({super.key, required this.title});
  final String title;

  @override
  State<FilterItme> createState() => _FilterItmeState();
}

class _FilterItmeState extends State<FilterItme> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: isSelected ? 1.05 : 0.95,
        curve: Curves.easeInOutCubicEmphasized,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.instance.black
                : AppColors.instance.grey.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Text(
            widget.title,
            style: AppTextStyle.instance.text14W500Black.copyWith(
              color: isSelected
                  ? AppColors.instance.white
                  : AppColors.instance.black,
            ),
          ),
        ),
      ),
    );
  }
}
