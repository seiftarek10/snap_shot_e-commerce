import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';
import 'package:snap_shot/features/authentication/presentation/view/widgets/auth_page_title.dart';
import 'package:snap_shot/features/authentication/presentation/view/widgets/or_divider.dart';
import 'package:snap_shot/features/authentication/presentation/view/widgets/phone_or_email.dart';
import 'package:snap_shot/features/authentication/presentation/view/widgets/sign_in_widgets/social_button.dart';
import 'package:snap_shot/features/authentication/presentation/view/widgets/sign_up_widgets/have_account.dart';
import 'package:snap_shot/features/authentication/presentation/view/widgets/sign_up_widgets/sign_up_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: PagePadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpace.instance.topPageSpace,
                AuthPageTitle(title: 'Create Your Account'),
                AppSpace.instance.v12,
                PhoneOrEmailWidget(choise: (choise) {}),
                AppSpace.instance.v16,
                SignUpForm(),
                AppSpace.instance.v12,
                OrDivider(),
                AppSpace.instance.v16,
                SocialButton(
                  platForm: 'Facbook',
                  icon: FontAwesomeIcons.facebook,
                  iconColor: AppColors.instance.blue,
                ),
                AppSpace.instance.v16,
                SocialButton(
                  platForm: 'Google',
                  icon: FontAwesomeIcons.google,
                  iconColor: AppColors.instance.green,
                ),
                AppSpace.instance.v20,
                Center(child: HaveAccount()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
