import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/colors.dart';

class OnBoardingDots extends StatelessWidget {
  const OnBoardingDots({super.key, required this.currentIndex});
final int currentIndex; 
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Container(
          height: currentIndex==index ? 8.h : 6.h,
          width: currentIndex==index? 8.w : 6.w,
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          decoration: BoxDecoration(
            color: currentIndex == index ? AppColors.instance.black : AppColors.instance.grey,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
