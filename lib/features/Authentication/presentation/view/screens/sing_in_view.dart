import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';

import 'package:snap_shot/core/widgets/page_padding.dart';
import 'package:snap_shot/features/Authentication/presentation/view/widgets/auth_page_title.dart';
import 'package:snap_shot/features/Authentication/presentation/view/widgets/phone_or_email.dart';
import 'package:snap_shot/features/Authentication/presentation/view/widgets/sign%20in%20widgets/sing_in_from.dart';

class SingInView extends StatelessWidget {
  const SingInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PagePadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppSpace.instance.topPageSpace,
              const AuthPageTitle(title: "Welcome Back!"),
              AppSpace.instance.v8,
              PhoneOrEmailWidget(choise: (choise) {}),
              AppSpace.instance.v16,
              const SignInForm(),
              
            ],
          ),
        ),
      ),
    );
  }
}
