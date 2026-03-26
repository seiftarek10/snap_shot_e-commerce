import 'package:flutter/material.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class OnBoardignBottomSection extends StatelessWidget {
  const OnBoardignBottomSection({super.key});

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
        SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
          ),
          child: Text(
            'Next',
            style: AppTextStyle.instance.text16W400.copyWith(
              color: AppColors.instance.white,
            ),
          ),
        ),
        SizedBox(height: 34),
        Text(
          'By Tapping Get Started and using the shooping app you are agreeing to our Terms of Service and Privacy Policy',
          textAlign: TextAlign.center,
          style: AppTextStyle.instance.text11W200grey,
        ),
      ],
    );
  }
}
