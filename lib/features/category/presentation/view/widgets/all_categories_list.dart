
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/features/category/presentation/view/widgets/category_item.dart';

class AllCategoriesSliverList extends StatelessWidget {
  const AllCategoriesSliverList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 20,
    
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: const CategoryItem(),
        );
      },
    );
  }
}
