import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class OtpFields extends StatelessWidget {
  const OtpFields({super.key, this.onSubmit});
 final void Function(String)? onSubmit;

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      keyboardType: TextInputType.number,
      numberOfFields: 6,
      textStyle: AppTextStyle.instance.text28Bold,
      cursorColor: AppColors.instance.black,
      focusedBorderColor: AppColors.instance.black,
      borderColor: AppColors.instance.black,
      borderWidth: 4,
      borderRadius: BorderRadius.circular(8),
      showFieldAsBox: false,
      fieldHeight: 50.h,
      fieldWidth: 40.w,
      onSubmit: onSubmit
    );
  }
}