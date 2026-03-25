import 'package:flutter/material.dart';
import 'package:snap_shot/core/routing/app_router.dart';

class SnapShot extends StatelessWidget {
  const SnapShot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
