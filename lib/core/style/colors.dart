import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static final AppColors instance = AppColors._();

  Color get black => Colors.black;
  Color get grey => Colors.grey;
  Color get white => Colors.white;
  Color get greyLight => Color(0xffA0A0A0);
  Color get lighterGrey => Color(0xffE6E6E6);
  Color get darkGrey => Colors.grey[600]!;
  Color get blue => Colors.blue[700]!;
  Color get green => Colors.green[700]!;
}
