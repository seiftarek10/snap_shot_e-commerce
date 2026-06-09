import 'package:device_preview/device_preview.dart';
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
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          locale: DevicePreview.locale(context),
          builder: (context, routerChild) {
            ScreenUtil.configure(data: MediaQuery.of(context));
            return DevicePreview.appBuilder(context, routerChild);
          },
          theme: ThemeData(scaffoldBackgroundColor: AppColors.instance.white),
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
