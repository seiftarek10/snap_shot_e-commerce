import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/colors.dart';

class AppCircularCheckBox extends StatelessWidget {
  const AppCircularCheckBox({super.key, required this.isSelected});
final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isSelected == true ? AppColors.instance.white : null,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.instance.white, width: 3),
          ),
          child: isSelected == true
              ? Icon(Icons.check, size: 14.h, color: AppColors.instance.black)
              : Padding(padding: EdgeInsets.all(7.h)),
        );
  }
}