import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSpace {
  AppSpace._();
  static final AppSpace instance = AppSpace._();

  SizedBox get topPageSpace => SizedBox(height: 50.h);
  SizedBox get v4 => SizedBox(height: 4.h);
  SizedBox get v8 => SizedBox(height: 8.h);
  SizedBox get v16 => SizedBox(height: 16.h);
  SizedBox get v20 => SizedBox(height: 20.h);
  SizedBox get v24 => SizedBox(height: 24.h);
  SizedBox get v32 => SizedBox(height: 32.h);
  SizedBox get v40 => SizedBox(height: 40.h);
  SizedBox get v50 => SizedBox(height: 50.h);
  SizedBox get h4 => SizedBox(width: 32.w);
  SizedBox get h8 => SizedBox(width: 8.w);
  SizedBox get h16 => SizedBox(width: 16.w);
  SizedBox get h32 => SizedBox(width: 32.w);
}
