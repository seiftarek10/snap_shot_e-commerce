import 'package:flutter/material.dart';
import 'package:snap_shot/features/onBoarding/presentation/view/widgets/on_boarding_body.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late int _currentIndex;
  late PageController _pageController;
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
      backgroundColor: Colors.white,
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
            ),
            OnBoardingBody(
              currntIndex: _currentIndex,
              onPressed: () {
                nextPage();
              },
            ),
            OnBoardingBody(
              currntIndex: _currentIndex,
              onPressed: () {
                nextPage();
              },
            ),
          ],
        ),
      ),
    );
  }
}
