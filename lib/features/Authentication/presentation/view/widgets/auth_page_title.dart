import 'package:flutter/material.dart';
import 'package:snap_shot/core/style/fonts.dart';

class AuthPageTitle extends StatelessWidget {
  const AuthPageTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyle.instance.text20W500.copyWith(
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
