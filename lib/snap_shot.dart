import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_shot/core/style/colors.dart';

class SnapShot extends StatelessWidget {
  const SnapShot({super.key, required this.router});
  final GoRouter router;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      child: MaterialApp.router(
        theme: ThemeData(scaffoldBackgroundColor: AppColors.instance.white),
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
