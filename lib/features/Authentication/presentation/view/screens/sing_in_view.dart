import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/features/Authentication/presentation/view/widgets/auth_page_title.dart';

class SingInView extends StatelessWidget {
  const SingInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppSpace.instance.topPageSpace,
            AuthPageTitle(title: "Welcome Back!"),
          ],
        ),
      ),
    );
  }
}
