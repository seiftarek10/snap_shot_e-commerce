import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';

import 'package:snap_shot/core/widgets/page_padding.dart';
import 'package:snap_shot/features/authentication/presentation/view/widgets/auth_page_title.dart';
import 'package:snap_shot/features/authentication/presentation/view/widgets/or_divider.dart';
import 'package:snap_shot/features/authentication/presentation/view/widgets/phone_or_email.dart';
import 'package:snap_shot/features/authentication/presentation/view/widgets/sign_in_widgets/no_account.dart';
import 'package:snap_shot/features/authentication/presentation/view/widgets/sign_in_widgets/sing_in_from.dart';
import 'package:snap_shot/features/authentication/presentation/view/widgets/sign_in_widgets/social_button.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

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
                const AuthPageTitle(title: "Welcome Back!"),
                AppSpace.instance.v16,
                PhoneOrEmailWidget(choise: (choise) {}),
                AppSpace.instance.v16,
                const SignInForm(),
                AppSpace.instance.v12,
                OrDivider(),
                AppSpace.instance.v16,
                SocialButton(
                  platForm: 'Facebook',
                  icon: FontAwesomeIcons.facebook,
                  iconColor: AppColors.instance.blue,
                ),
                AppSpace.instance.v16,
                SocialButton(
                  platForm: 'Google',
                  icon: FontAwesomeIcons.google,
                  iconColor: AppColors.instance.green,
                ),
                AppSpace.instance.v24,
                Center(
                  child: NoAccount(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
