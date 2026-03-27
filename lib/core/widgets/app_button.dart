import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.buttonTitle,
    required this.onPressed,
  });
  final String buttonTitle;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.symmetric(vertical: 12.h),
      ),
      child: Text(
        buttonTitle,
        style: AppTextStyle.instance.text16W400.copyWith(
          color: AppColors.instance.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
