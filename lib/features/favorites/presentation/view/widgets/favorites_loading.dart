import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/shared/widgets/stete_widgets/app_loading_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FavoritesLoading extends StatelessWidget {
  const FavoritesLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLoadingWidget(
      child: GridView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(), 
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 1 / 1.6, 
        ),
        children: List.generate(6, (index) {
          return Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Bone(),
                    ),
                  ),
                  SizedBox(height: 12.h),

                  Bone(
                    height: 14.h,
                    width: double.infinity, 
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  SizedBox(height: 8.h),

                  Bone(
                    height: 12.h,
                    width: 75.w,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  SizedBox(height: 12.h),

                  Bone(
                    height: 18.h,
                    width: 50.w,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}