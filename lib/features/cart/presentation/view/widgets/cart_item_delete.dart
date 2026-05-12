import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snap_shot/core/constants/assets.dart';
import 'package:snap_shot/core/style/colors.dart';

class CartItemDeleteIcon extends StatelessWidget {
  const CartItemDeleteIcon({super.key, required this.clickDelete});
  final void Function() clickDelete;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: InkWell(
        onTap: clickDelete,
        child: SvgPicture.asset(
          Assets.imagesSvgDelete,
          height: 25.h,
          colorFilter: ColorFilter.mode(
            AppColors.instance.blueGrey,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
