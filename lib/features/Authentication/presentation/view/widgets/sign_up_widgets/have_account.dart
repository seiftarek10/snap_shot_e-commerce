import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_shot/core/routing/routes.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account ? ',
            style: AppTextStyle.instance.text12W500Black,
            children: [
              TextSpan(
                text: 'Sign In',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    GoRouter.of(context).push(Routes.instance.signIn);
                  },
                style: AppTextStyle.instance.text12W500Black.copyWith(
                  color: AppColors.instance.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
