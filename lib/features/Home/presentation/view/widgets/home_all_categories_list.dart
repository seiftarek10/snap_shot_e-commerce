import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/features/Home/presentation/view/widgets/home_category_item.dart';

class HomeAllCategoriesList extends StatefulWidget {
  const HomeAllCategoriesList({super.key});

  @override
  State<HomeAllCategoriesList> createState() => _HomeAllCategoriesListState();
}

class _HomeAllCategoriesListState extends State<HomeAllCategoriesList> {
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
              child: HomeCategoryItem(
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
