import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:snap_shot/constants/assets.dart';

class OnBoardingImage extends StatelessWidget {
  const OnBoardingImage({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: CircularDottedBorderOptions(
        padding: EdgeInsets.all(8),
        color: Colors.grey,
        strokeWidth: 2.3,
        dashPattern: [20, 10],
      ),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(60),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[300],
          ),
          child: SizedBox(
            height: 500,
            width: 500,
            child: Image.asset(
              Assets.imagesPngOnboardingimage1,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
