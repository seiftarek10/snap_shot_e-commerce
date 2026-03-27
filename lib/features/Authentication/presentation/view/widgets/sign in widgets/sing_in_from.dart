import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/core/widgets/app_button.dart';
import 'package:snap_shot/core/widgets/app_text_filed.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextField(
            hintText: 'Email',
            onSaved: (value) {},
            keyboardType: TextInputType.emailAddress,
          ),
          AppSpace.instance.v8,
          AppTextField(
            hintText: 'Password',
            isPasswordField: true,
            onSaved: (value) {},
            keyboardType: TextInputType.visiblePassword,
          ),
          AppSpace.instance.v12,
          AppButton(buttonTitle: 'Sign In', onPressed: () {}),
          AppSpace.instance.v8,
          Center(
            child: TextButton(
              style: TextButton.styleFrom(
                overlayColor: AppColors.instance.darkGrey,
              ),
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: AppTextStyle.instance.text12W200.copyWith(
                  color: AppColors.instance.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
