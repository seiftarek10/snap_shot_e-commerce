import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/features/onBoarding/data/Models/on_boarding_info.dart';
import 'package:snap_shot/features/onBoarding/presentation/view/widgets/on_boardign_bottom_section.dart';
import 'package:snap_shot/features/onBoarding/presentation/view/widgets/on_boarding_image.dart';
import 'package:snap_shot/features/onBoarding/presentation/view/widgets/on_boarding_sentence_market.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({
    super.key,
    required this.currntIndex,
    required this.onPressed,
    required this.onBoardingInfoModel,
  });
  final int currntIndex;
  final void Function() onPressed;
  final OnBoardingInfoModel onBoardingInfoModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppSpace.instance.v50,
            OnBoardingImage(imagePath: onBoardingInfoModel.imagePath),
            AppSpace.instance.v4,
            OnBoardingSentenceMarket(text: onBoardingInfoModel.sentence),
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
