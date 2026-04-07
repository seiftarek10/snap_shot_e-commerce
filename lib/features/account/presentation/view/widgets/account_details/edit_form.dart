
import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/shared/widgets/app_button.dart';
import 'package:snap_shot/shared/widgets/app_text_filed.dart';

class AccountDetailsEditForm extends StatelessWidget {
  const AccountDetailsEditForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextField(
            hintText: 'User Name',
            onSaved: (userName) {},
            keyboardType: TextInputType.text,
          ),
          AppSpace.instance.v12,
          AppTextField(
            hintText: 'Mobile Number',
            onSaved: (userName) {},
            keyboardType: TextInputType.number,
          ),
          AppSpace.instance.v12,
          AppTextField(
            hintText: 'Email',
            onSaved: (userName) {},
            keyboardType: TextInputType.text,
          ),
          AppSpace.instance.v12,
          AppTextField(
            hintText: 'Password',
            onSaved: (userName) {},
            keyboardType: TextInputType.text,
          ),
          AppSpace.instance.v32,
          AppButton(buttonTitle: ('Edit'), onPressed: (){}),
        ],
      ),
    );
  }
}
