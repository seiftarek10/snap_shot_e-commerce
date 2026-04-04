import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/features/favorites/presentation/view/widgets/favorite_item.dart';
import 'package:snap_shot/shared/widgets/page_title.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              AppSpace.instance.topPageSpace,
              const PageTitle(pageTitle: 'Favorite List'),
              AppSpace.instance.v16,
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          sliver: SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 1 / 1.8,
            ),
            itemBuilder: (context, index) {
              return const FavoriteItem();
            },
          ),
        ),
      ],
    );
  }
}
