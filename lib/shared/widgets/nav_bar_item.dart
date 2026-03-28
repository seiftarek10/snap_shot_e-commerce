import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/colors.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({super.key, required this.icon, required this.isActive});
  final String icon;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: isActive ? AppColors.instance.black : null,
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        icon,
        height: 20.sp,
        fit: BoxFit.fill,
        color: isActive ? Colors.white : null,
      ),
    );
  }
}
