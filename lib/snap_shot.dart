import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/routing/app_router.dart';
import 'package:snap_shot/core/style/colors.dart';

class SnapShot extends StatelessWidget {
  const SnapShot({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      child: MaterialApp.router(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.instance.white,
        ),
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
