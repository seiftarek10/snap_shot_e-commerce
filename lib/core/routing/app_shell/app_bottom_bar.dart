import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/assets.dart';
import 'package:snap_shot/core/routing/app_router.dart';
import 'package:snap_shot/core/routing/app_shell/nav_bar_item.dart';

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({
    super.key,
    required this.onTap,
    required this.role,
    required this.index,
  });
  final ValueChanged<int> onTap;
  final Role role;
  final int index;
  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  late int currentIndex;
  late final List<String> _icons;

  List<String> _buildIcons(Role role) {
    switch (role) {
      case Role.user:
        return const [
          Assets.imagesPngHome,
          Assets.imagesPngOrder,
          Assets.imagesPngHeart,
          Assets.imagesPngShoppingBag,
          Assets.imagesPngUser,
        ];
      case Role.owner:
        return const [
          Assets.imagesPngHome,
          Assets.imagesPngCategory,
          Assets.imagesPngOrder,
        ];
      case Role.staff:
        return const [
          Assets.imagesPngHome,
          Assets.imagesPngCategory,
          Assets.imagesPngHeart,
        ];
      default:
        return const [
          Assets.imagesPngHome,
          Assets.imagesPngCategory,
          Assets.imagesPngHeart,
        ];
    }
  }

  @override
  void initState() {
    super.initState();
    currentIndex = widget.index;
    _icons = _buildIcons(widget.role);
  }

  @override
  void didUpdateWidget(covariant AppBottomBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {
      setState(() {
        currentIndex = widget.index;
      });
    }
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
                widget.onTap(currentIndex);
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
