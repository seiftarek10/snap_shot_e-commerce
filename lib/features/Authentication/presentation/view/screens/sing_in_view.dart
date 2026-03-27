import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/widgets/app_button.dart';
import 'package:snap_shot/core/widgets/app_text_filed.dart';
import 'package:snap_shot/core/widgets/page_padding.dart';
import 'package:snap_shot/features/Authentication/presentation/view/widgets/auth_page_title.dart';
import 'package:snap_shot/features/Authentication/presentation/view/widgets/phone_or_email.dart';

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
              AuthPageTitle(title: "Welcome Back!"),
              AppSpace.instance.v8,
              PhoneOrEmailWidget(choise: (choise) {}),
              AppSpace.instance.v16,
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
            ],
          ),
        ),
      ),
    );
  }
}
