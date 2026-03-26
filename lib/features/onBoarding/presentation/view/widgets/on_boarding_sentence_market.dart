import 'package:flutter/material.dart';
import 'package:snap_shot/core/style/fonts.dart';

class OnBoardingSentenceMarket extends StatelessWidget {
  const OnBoardingSentenceMarket({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'One best app for all your needs',
      textAlign: TextAlign.center,
      style: AppTextStyle.instance.text24W500.copyWith(
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
