import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/shared/widgets/stete_widgets/app_loading_widget.dart';

class UserCategoriesLoadingWidget extends StatelessWidget {
  const UserCategoriesLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(5, (index) {
          return SizedBox(
            width: 120.w,
            child: AppLoadingWidget(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Center(
                  child: Text(
                    'TTTTtt',
                    style: AppTextStyle.instance.text34W700,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
