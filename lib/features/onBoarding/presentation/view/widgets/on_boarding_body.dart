import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/assets.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/features/onBoarding/presentation/view/widgets/on_boardign_bottom_section.dart';
import 'package:snap_shot/features/onBoarding/presentation/view/widgets/on_boarding_image.dart';
import 'package:snap_shot/features/onBoarding/presentation/view/widgets/on_boarding_sentence_market.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key, required this.currntIndex, required this.onPressed});
  final int currntIndex;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppSpace.instance.topPageSpace,
            OnBoardingImage(imagePath: Assets.imagesPngOnboardingimage1),
            AppSpace.instance.v4,
            OnBoardingSentenceMarket(text: 'One best app for all your needs'),
            AppSpace.instance.v4,
            OnBoardignBottomSection(
              currentIndex: currntIndex,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
