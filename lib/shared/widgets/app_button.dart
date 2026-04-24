import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.buttonTitle,
    required this.onPressed,
    this.outlineButton,
    this.backgroundColor, required this.isClicked,
  });
  final String buttonTitle;
  final void Function() onPressed;
  final bool? outlineButton;
  final Color? backgroundColor;
  final bool isClicked;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: outlineButton == true
            ? AppColors.instance.white
            : backgroundColor ?? AppColors.instance.black,
        side: BorderSide(
          color: outlineButton == true
              ? AppColors.instance.black
              : backgroundColor ?? AppColors.instance.black,
          width: 1.5,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.symmetric(vertical: 12.h),
      ),

      child: isClicked==true?SizedBox(
        height: 20.h,
        width: 20.w,
        child: CircularProgressIndicator(
          color: AppColors.instance.white,
        ),
      ) : Text(
        buttonTitle,
        style: AppTextStyle.instance.text16W400.copyWith(
          color: outlineButton == true
              ? AppColors.instance.black
              : AppColors.instance.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
