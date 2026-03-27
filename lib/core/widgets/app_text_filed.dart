import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({super.key, required this.hintText, required this.onSaved});
  final String hintText;
  final void Function(String?) onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      cursorColor: AppColors.instance.black,
      cursorHeight: 20.h,
      style: AppTextStyle.instance.text16W400.copyWith(
        color: AppColors.instance.black,
        fontWeight: FontWeight.w900,
      ),
      decoration: InputDecoration(
        hintText: 'Email',
        hintStyle: AppTextStyle.instance.textFieldStyle,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.instance.black, width: 3.5),
        ),
      ),
    );
  }
}
