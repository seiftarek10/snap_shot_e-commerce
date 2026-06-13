import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/assets.dart';
import 'package:snap_shot/core/routing/app_router.dart';
import 'package:snap_shot/core/routing/app_shell/log_out_button.dart';
import 'package:snap_shot/core/routing/app_shell/nav_bar_item.dart';

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({
    super.key,
    required this.onTap,
    required this.role,
    required this.index,
  });

  final ValueChanged<int> onTap;
  final Role role;
  final int index;

  List<String> _buildIcons(Role role) {
    switch (role) {
      case Role.user:
        return const [
          Assets.imagesPngHome,
          Assets.imagesPngOrder,
          Assets.imagesPngHeart,
          Assets.imagesPngShoppingBag,
        ];
      case Role.owner:
        return const [
          Assets.imagesPngHome,
          Assets.imagesPngCategory,
          Assets.imagesPngOrder,
          Assets.imagesPngUser,
        ];
      case Role.staff:
      default:
        return const [
          Assets.imagesPngHome,
          Assets.imagesPngCategory,
          Assets.imagesPngHeart,
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final icons = _buildIcons(role);

    return SizedBox(
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...List.generate(
            icons.length,
            (i) => GestureDetector(
              onTap: () {
                onTap(i);
              },
              child: NavBarItem(icon: icons[i], isActive: index == i),
            ),
          ),
          if (role == Role.user)
           const LogOutButton()
        ],
      ),
    );
  }
}
