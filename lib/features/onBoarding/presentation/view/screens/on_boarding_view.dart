import 'package:flutter/material.dart';
import 'package:snap_shot/features/onBoarding/presentation/view/widgets/on_boardign_bottom_section.dart';
import 'package:snap_shot/features/onBoarding/presentation/view/widgets/on_boarding_image.dart';
import 'package:snap_shot/features/onBoarding/presentation/view/widgets/on_boarding_sentence_market.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OnBoardingImage(),
            SizedBox(height: 40),
            OnBoardingSentenceMarket(),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: OnBoardignBottomSection(),
            ),
          ],
        ),
      ),
    );
  }
}
