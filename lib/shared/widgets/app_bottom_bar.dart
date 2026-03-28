import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/assets.dart';
import 'package:snap_shot/shared/widgets/nav_bar_item.dart';

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({super.key});

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  late int currentIndex;
  final List<String> _icons = [
    Assets.imagesPngHome,
    Assets.imagesPngCategory,
    Assets.imagesPngHeart,
    Assets.imagesPngShoppingBag,
    Assets.imagesPngUser,
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          _icons.length,
          (index) => GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: NavBarItem(
              icon: _icons[index],
              isActive: currentIndex == index,
            ),
          ),
        ),
      ),
    );
  }
}
