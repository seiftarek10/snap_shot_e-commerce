import 'package:flutter/material.dart';
import 'package:snap_shot/core/style/fonts.dart';

class OnBoardingSentenceMarket extends StatelessWidget {
  const OnBoardingSentenceMarket({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
     text,
      textAlign: TextAlign.center,
      style: AppTextStyle.instance.text24W500.copyWith(
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
