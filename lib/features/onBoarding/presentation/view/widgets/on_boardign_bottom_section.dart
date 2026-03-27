import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/features/onBoarding/presentation/view/widgets/on_boarding_dots.dart';

class OnBoardignBottomSection extends StatelessWidget {
  const OnBoardignBottomSection({super.key, required this.currentIndex, required this.onPressed});

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
        OnBoardingDots(
          currentIndex: currentIndex,
        ),
        AppSpace.instance.v20,
        ElevatedButton(
          onPressed:onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(vertical: 15.h),
          ),
          child: Text(
            'Next',
            style: AppTextStyle.instance.text16W400.copyWith(
              color: AppColors.instance.white,
            ),
          ),
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
