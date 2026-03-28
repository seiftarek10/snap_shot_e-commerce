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
  final List<NavBarItem> _navBarItems = [
    const NavBarItem(icon: Assets.imagesPngHome, isActive: true),
    const NavBarItem(icon: Assets.imagesPngCategory, isActive: false),
    const NavBarItem(icon: Assets.imagesPngHeart, isActive: false),
    const NavBarItem(icon: Assets.imagesPngShoppingBag, isActive: false),
    const NavBarItem(icon: Assets.imagesPngUser, isActive: false),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          _navBarItems.length,
          (index) => _navBarItems[index],
        ),
      ),
    );
  }
}
