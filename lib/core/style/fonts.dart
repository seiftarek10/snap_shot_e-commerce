import 'package:flutter/material.dart';

class AppTextStyle {
  AppTextStyle._();

  static final AppTextStyle instance = AppTextStyle._();

  TextStyle get text16W200 =>
      TextStyle(fontSize: 16, fontWeight: FontWeight.w200, fontFamily: 'inter');
  TextStyle get text16W400 =>
      TextStyle(fontSize: 16, fontWeight: FontWeight.w400, fontFamily: 'inter');
  TextStyle get text18W200 =>
      TextStyle(fontSize: 18, fontWeight: FontWeight.w200, fontFamily: 'inter');
  TextStyle get text18W300 =>
      TextStyle(fontSize: 18, fontWeight: FontWeight.w300, fontFamily: 'inter');
  TextStyle get text18W500 =>
      TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'inter');
  TextStyle get text20W300 =>
      TextStyle(fontSize: 20, fontWeight: FontWeight.w300, fontFamily: 'inter');
  TextStyle get text20W500 =>
      TextStyle(fontSize: 20, fontWeight: FontWeight.w500, fontFamily: 'inter');

  TextStyle get text24W300 =>
      TextStyle(fontSize: 24, fontWeight: FontWeight.w300, fontFamily: 'inter');
  TextStyle get text24W500 =>
      TextStyle(fontSize: 24, fontWeight: FontWeight.w500, fontFamily: 'inter');
  TextStyle get text28W500 =>
      TextStyle(fontSize: 28, fontWeight: FontWeight.w500, fontFamily: 'inter');
  TextStyle get text28W300 =>
      TextStyle(fontSize: 28, fontWeight: FontWeight.w300, fontFamily: 'inter');
  TextStyle get text34W500 =>
      TextStyle(fontSize: 34, fontWeight: FontWeight.w500, fontFamily: 'inter');
  TextStyle get text34W700 =>
      TextStyle(fontSize: 34, fontWeight: FontWeight.w700, fontFamily: 'inter');
  TextStyle get text50W500 =>
      TextStyle(fontSize: 50, fontWeight: FontWeight.w500, fontFamily: 'inter');
  TextStyle get text50W700 =>
      TextStyle(fontSize: 50, fontWeight: FontWeight.w700, fontFamily: 'inter');
}
