import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/shared/widgets/stete_widgets/app_loading_widget.dart';

class FavoritesLoading extends StatelessWidget {
  const FavoritesLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLoadingWidget(
      child: GridView(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 1 / 1.8,
        ),
        children: List.generate(6, (index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AspectRatio(
                    aspectRatio: 0.4.h,
                    child: const Bone(),
                  ),
                  AppSpace.instance.v12,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Bone.text(words: 2,fontSize: 15,), 
                      IconButton(onPressed: null, icon: Bone.icon(size: 30.h)),
                    ],
                  ),

                  const Bone.text(words: 1),
                  AppSpace.instance.v16,
                  const Bone.text(words: 1, fontSize: 20),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
