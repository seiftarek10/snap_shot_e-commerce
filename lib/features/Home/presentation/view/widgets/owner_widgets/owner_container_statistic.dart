import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class OwnerContainerStatistic extends StatelessWidget {
  const OwnerContainerStatistic({super.key});

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
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Expanded(
                    child: Text(
                      'View',
                      style: AppTextStyle.instance.text16W400.copyWith(
                        color: AppColors.instance.white,
                      ),
                    ),
                  ),
                  AppSpace.instance.v8,

                  Expanded(
                    child: Text(
                      'View',
                      style: AppTextStyle.instance.text18W700.copyWith(
                        color: AppColors.instance.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,

              child: Column(
                children: [
                  Expanded(
                    child: Icon(
                      Icons.arrow_outward,
                      color: AppColors.instance.white,
                    ),
                  ),
                  AppSpace.instance.v8,
                  Expanded(
                    child: Text(
                      'View',
                      style: AppTextStyle.instance.text16W400.copyWith(
                        color: AppColors.instance.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
