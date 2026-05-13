import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/shared/widgets/stete_widgets/app_loading_widget.dart';

class CheckoutAddressLoading extends StatelessWidget {
  const CheckoutAddressLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLoadingWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Bone.text(words: 2, style: AppTextStyle.instance.text18W700),
              Bone.text(words: 1, style: AppTextStyle.instance.text18W700),
            ],
          ),
          AppSpace.instance.v16,
          Row(
            children: [
              Bone.icon(size: 25.h),

              AppSpace.instance.h12,
              Expanded(
                child: Bone.text(
                  words: 6,
                  style: AppTextStyle.instance.text14W500Black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
