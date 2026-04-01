import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/colors.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({super.key, required this.icon, required this.isActive});
  final String icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: isActive ? AppColors.instance.black : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        transitionBuilder: (child, animation) => ScaleTransition(
          scale: animation,
          child: FadeTransition(opacity: animation, child: child),
        ),
        child: Image.asset(
          icon,
          key: ValueKey(isActive),
          height: 20.sp,
          fit: BoxFit.fill,
          color: isActive ? Colors.white : null,
        ),
      ),
    );
  }
}
