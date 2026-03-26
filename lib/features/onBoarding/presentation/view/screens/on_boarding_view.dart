import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/constants/assets.dart';
import 'package:snap_shot/features/onBoarding/presentation/view/widgets/on_boardign_bottom_section.dart';
import 'package:snap_shot/features/onBoarding/presentation/view/widgets/on_boarding_image.dart';
import 'package:snap_shot/features/onBoarding/presentation/view/widgets/on_boarding_sentence_market.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),
              OnBoardingImage(imagePath: Assets.imagesPngOnboardingimage1),
              SizedBox(height: 40),
              OnBoardingSentenceMarket(text: 'One best app for all your needs'),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: OnBoardignBottomSection(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
