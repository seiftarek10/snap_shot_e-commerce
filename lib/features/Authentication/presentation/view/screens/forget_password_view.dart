import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/shared/widgets/app_button.dart';
import 'package:snap_shot/shared/widgets/arrow_back.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';
import 'package:snap_shot/features/authentication/presentation/view/widgets/auth_page_title.dart';
import 'package:snap_shot/features/authentication/presentation/view/widgets/forget_password/all_send_code_options.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: PagePadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppSpace.instance.topPageSpace,
                ArrowBackWidget(),
                AppSpace.instance.v20,
                AuthPageTitle(title: "Forget Password"),
                AppSpace.instance.v16,
                AllSendCodeOptions(),
                AppSpace.instance.v50,
                AppButton(buttonTitle: ('Next'), onPressed: () => {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
