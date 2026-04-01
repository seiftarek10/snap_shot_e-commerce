import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/features/Home/presentation/view/widgets/category_item.dart';

class AllCategoriesList extends StatefulWidget {
  const AllCategoriesList({super.key});

  @override
  State<AllCategoriesList> createState() => _AllCategoriesListState();
}

class _AllCategoriesListState extends State<AllCategoriesList> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: Padding(
              padding: EdgeInsetsGeometry.only(right: 12.w),
              child: CategoryItem(
                isSelected: index == currentIndex,
                title: 'title',
              ),
            ),
          );
        },
      ),
    );
  }
}
