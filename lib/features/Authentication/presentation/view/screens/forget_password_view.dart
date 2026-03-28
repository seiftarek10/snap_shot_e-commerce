import 'package:flutter/material.dart';
import 'package:snap_shot/core/style/fonts.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password", style: AppTextStyle.instance.text20W500),
        leading: Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}
