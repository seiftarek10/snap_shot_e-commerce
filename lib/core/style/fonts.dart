import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/colors.dart';

class AppTextStyle {
  AppTextStyle._();

  static final AppTextStyle instance = AppTextStyle._();

  TextStyle get text11W200grey => TextStyle(
    fontSize: 11.h,
    fontWeight: FontWeight.w200,
    fontFamily: 'inter',
    color: AppColors.instance.darkGrey,
  );

  TextStyle get text12W200 => TextStyle(
    fontSize: 12.h,
    fontWeight: FontWeight.w200,
    fontFamily: 'inter',
  );
    TextStyle get text12W500 => TextStyle(
    fontSize: 12.h,
    fontWeight: FontWeight.w500,
    fontFamily: 'inter',
  );

    TextStyle get text12W500Black => TextStyle(
    fontSize: 12.h,
    fontWeight: FontWeight.w500,
    fontFamily: 'inter',
    color: AppColors.instance.black,
  );
    TextStyle get text14W500Black => TextStyle(
    fontSize: 15.h,
    fontWeight: FontWeight.w500,
    fontFamily: 'inter',
    color: AppColors.instance.black,
  );
    TextStyle get text14WBoldBlack => TextStyle(
    fontSize: 15.h,
    fontWeight: FontWeight.bold,
    fontFamily: 'inter',
    color: AppColors.instance.black,
  );
  TextStyle get text16W200 => TextStyle(
    fontSize: 16.h,
    fontWeight: FontWeight.w200,
    fontFamily: 'inter',
  );

  TextStyle get textFieldStyle => TextStyle(
    fontSize: 14.h,
    fontWeight: FontWeight.w600,
    color: AppColors.instance.darkGrey,
    fontFamily: 'inter',
  );
  TextStyle get text16W400 => TextStyle(
    fontSize: 16.h,
    fontWeight: FontWeight.w400,
    fontFamily: 'inter',
  );
  TextStyle get text18W200 => TextStyle(
    fontSize: 18.h,
    fontWeight: FontWeight.w200,
    fontFamily: 'inter',
  );
  TextStyle get text18W300 => TextStyle(
    fontSize: 18.h,
    fontWeight: FontWeight.w300,
    fontFamily: 'inter',
  );
  TextStyle get text18W500 => TextStyle(
    fontSize: 18.h,
    fontWeight: FontWeight.w500,
    fontFamily: 'inter',
  );
  TextStyle get text20W300 => TextStyle(
    fontSize: 20.h,
    fontWeight: FontWeight.w300,
    fontFamily: 'inter',
  );
  TextStyle get text20W500 => TextStyle(
    fontSize: 20.h,
    fontWeight: FontWeight.w500,
    fontFamily: 'inter',
  );

  TextStyle get text22Bold => TextStyle(
    fontSize: 22.h,
    fontWeight: FontWeight.w900,
    fontFamily: 'inter',
  );

  TextStyle get text24W300 => TextStyle(
    fontSize: 24.h,
    fontWeight: FontWeight.w300,
    fontFamily: 'inter',
  );
  TextStyle get text24W500 => TextStyle(
    fontSize: 24.h,
    fontWeight: FontWeight.w500,
    fontFamily: 'inter',
  );
  TextStyle get text28W500 => TextStyle(
    fontSize: 28.h,
    fontWeight: FontWeight.w500,
    fontFamily: 'inter',
  );
  TextStyle get text28Bold => TextStyle(
    fontSize: 28.h,
    fontWeight: FontWeight.w900,
    fontFamily: 'inter',
  );
  TextStyle get text28W300 => TextStyle(
    fontSize: 28.h,
    fontWeight: FontWeight.w300,
    fontFamily: 'inter',
  );
  TextStyle get text34W500 => TextStyle(
    fontSize: 34.h,
    fontWeight: FontWeight.w500,
    fontFamily: 'inter',
  );
  TextStyle get text34W700 => TextStyle(
    fontSize: 34.h,
    fontWeight: FontWeight.w700,
    fontFamily: 'inter',
  );
  TextStyle get text50W500 => TextStyle(
    fontSize: 50.h,
    fontWeight: FontWeight.w500,
    fontFamily: 'inter',
  );
  TextStyle get text50W700 => TextStyle(
    fontSize: 50.h,
    fontWeight: FontWeight.w700,
    fontFamily: 'inter',
  );
}
