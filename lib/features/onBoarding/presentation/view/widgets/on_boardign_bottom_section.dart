import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/core/widgets/app_button.dart';
import 'package:snap_shot/features/onBoarding/presentation/view/widgets/on_boarding_dots.dart';

class OnBoardignBottomSection extends StatelessWidget {
  const OnBoardignBottomSection({
    super.key,
    required this.currentIndex,
    required this.onPressed,
  });

  final int currentIndex;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Easy Shopping for all your needs just in hand trusted by millions of people in the world',
          textAlign: TextAlign.center,
          style: AppTextStyle.instance.text11W200grey,
        ),
        AppSpace.instance.v20,
        OnBoardingDots(currentIndex: currentIndex),
        AppSpace.instance.v20,
        AppButton(
          buttonTitle: currentIndex == 2 ? 'Get Started' : 'Next',
          onPressed: onPressed,
        ),

        AppSpace.instance.v16,
        Text(
          'By Tapping Get Started and using the shooping app you are agreeing to our Terms of Service and Privacy Policy',
          textAlign: TextAlign.center,
          style: AppTextStyle.instance.text11W200grey,
        ),
      ],
    );
  }
}
