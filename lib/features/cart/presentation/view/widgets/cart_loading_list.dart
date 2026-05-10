import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/shared/widgets/stete_widgets/app_loading_widget.dart';

class CartLoadingList extends StatelessWidget {
  const CartLoadingList({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLoadingWidget(
      child: ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 6.h),
            height: 160.h,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.instance.white,
              boxShadow: [
                BoxShadow(color: AppColors.instance.greyLight, blurRadius: 7),
              ],
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Bone.square(
                    size: double.infinity,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                AppSpace.instance.h12,
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Bone.multiText(lines: 2, fontSize: 20.h)),
                      Expanded(child: Bone.text(fontSize: 30.h)),
                      Expanded(child: Bone.text(words: 1, fontSize: 25.h)),
                    ],
                  ),
                ),

                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Bone.iconButton(size: 40.h),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
