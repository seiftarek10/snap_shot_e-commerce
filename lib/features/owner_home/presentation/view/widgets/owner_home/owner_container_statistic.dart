import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class OwnerContainerStatistic extends StatelessWidget {
  const OwnerContainerStatistic({
    super.key,
    required this.lable,
    required this.value,
    this.withGoArrow,
  });

  final String lable, value;
  final bool? withGoArrow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 70.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.instance.black,
            AppColors.instance.black.withValues(alpha: 0.7),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 7,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      lable,
                      style: AppTextStyle.instance.text14W500Black.copyWith(
                        color: AppColors.instance.greyLight,
                      ),
                    ),
                  ),
                  AppSpace.instance.v8,
                  Expanded(
                    child: Text(
                      value,
                      style: AppTextStyle.instance.text18W700.copyWith(
                        color: AppColors.instance.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          withGoArrow == null
              ? Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.arrow_outward,
                      color: AppColors.instance.white,
                      size: 16.h,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
