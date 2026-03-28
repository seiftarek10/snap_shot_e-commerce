import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snap_shot/core/constants/assets.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: PagePadding(
        child: Column(
          children: [
            AppSpace.instance.topPageSpace,
            SvgPicture.asset(
              Assets.imagesSvgSnapShopWord,
              height: 24.h,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
