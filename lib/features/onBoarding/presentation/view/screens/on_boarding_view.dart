import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/assets.dart';
import 'package:snap_shot/features/onBoarding/data/Models/on_boarding_info.dart';
import 'package:snap_shot/features/onBoarding/presentation/view/widgets/on_boarding_body.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late int _currentIndex;
  late PageController _pageController;
  final List<OnBoardingInfoModel> _onBoardingInfoList = [
    OnBoardingInfoModel(
      sentence: 'One best app for all your needs',
      imagePath: Assets.imagesPngOnboardingimage1,
    ),
    OnBoardingInfoModel(
      sentence: 'Get real-Time updates for all your Deliveries',
      imagePath: Assets.imagesPngOnboardingimage2,
    ),
    OnBoardingInfoModel(
      sentence: 'Follow And Get Update From Favorite Store',
      imagePath: Assets.imagesPngOnboardingimage3,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _pageController = PageController();
  }

  void nextPage() {
    if (_currentIndex < 2) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: [
            OnBoardingBody(
              currntIndex: _currentIndex,
              onPressed: () {
                nextPage();
              },
              onBoardingInfoModel: _onBoardingInfoList[0],
            ),
            OnBoardingBody(
              currntIndex: _currentIndex,
              onPressed: () {
                nextPage();
              },
              onBoardingInfoModel: _onBoardingInfoList[1],
            ),
            OnBoardingBody(
              currntIndex: _currentIndex,
              onPressed: () {
                nextPage();
              },
              onBoardingInfoModel: _onBoardingInfoList[2],
            ),
          ],
        ),
      ),
    );
  }
}
