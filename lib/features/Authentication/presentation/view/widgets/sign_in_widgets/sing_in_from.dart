import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/routing/routes.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/core/utils/validator.dart';
import 'package:snap_shot/shared/widgets/app_button.dart';
import 'package:snap_shot/shared/widgets/app_text_filed.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextField(
               validator: (value) {
                    return ValidationForm.validEmail(value);
                  },
            hintText: 'Email',
            onSaved: (value) {},
            keyboardType: TextInputType.emailAddress,
          ),
          AppSpace.instance.v8,
          AppTextField(
               validator: (value) {
                    return ValidationForm.validPassword(value);
                  },
            hintText: 'Password',
            isPasswordField: true,
            onSaved: (value) {},
            keyboardType: TextInputType.visiblePassword,
          ),
          AppSpace.instance.v12,
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              style: TextButton.styleFrom(
                overlayColor: AppColors.instance.darkGrey,
              ),
              onPressed: () {
                context.push(Routes.instance.forgetPassword);
              },
              child: Text(
                'Forgot Password?',
                style: AppTextStyle.instance.text12W500Black,
              ),
            ),
          ),
          AppSpace.instance.v12,
          AppButton(
            isClicked: false,
            buttonTitle: 'Sign In', onPressed: () {}),
          AppSpace.instance.v8,
        ],
      ),
    );
  }
}
