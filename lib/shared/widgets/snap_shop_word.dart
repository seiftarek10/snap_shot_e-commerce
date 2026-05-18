import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snap_shot/core/constants/assets.dart';

class SnapShotWord extends StatelessWidget {
  const SnapShotWord({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.imagesSvgSnapShopWord,
      height: 24.h,
      fit: BoxFit.fill,
    );
  }
}
