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

  TextStyle get text16W200 => TextStyle(
    fontSize: 16.h,
    fontWeight: FontWeight.w200,
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
