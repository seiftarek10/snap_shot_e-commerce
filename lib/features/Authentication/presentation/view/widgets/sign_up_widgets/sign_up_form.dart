import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/utils/validator.dart';
import 'package:snap_shot/shared/widgets/app_button.dart';
import 'package:snap_shot/shared/widgets/app_text_filed.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextField(
            hintText: 'Username',
            validator: (value) {
              return ValidationForm.nullOrEpmty(value);
            },
            onSaved: (value) {},
            keyboardType: TextInputType.text,
          ),
          AppSpace.instance.v8,
          AppTextField(
            hintText: 'Email',
            validator: (value) {
              return ValidationForm.validEmail(value);
            },
            onSaved: (value) {},
            keyboardType: TextInputType.text,
          ),
          AppSpace.instance.v8,
          AppTextField(
            validator: (value) {
              return ValidationForm.validPassword(value);
            },
            hintText: 'Password',
            onSaved: (value) {},
            keyboardType: TextInputType.text,
            isPasswordField: true,
          ),
          AppSpace.instance.v8,
          AppTextField(
            hintText: 'Mobile',
            validator: (value) {
              return ValidationForm.validPhoneNumber(value);
            },
            onSaved: (value) {},
            keyboardType: TextInputType.text,
          ),
          AppSpace.instance.v8,
          AppTextField(
            validator: (value) {
              return ValidationForm.nullOrEpmty(value);
            },
            hintText: 'Address',
            maxLines: 2,
            onSaved: (value) {},
            keyboardType: TextInputType.text,
          ),
          AppSpace.instance.v16,

          AppButton(buttonTitle: 'Sign Up', onPressed: () {}),
        ],
      ),
    );
  }
}
