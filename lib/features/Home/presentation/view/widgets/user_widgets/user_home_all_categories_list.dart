import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/features/home/presentation/view/widgets/user_widgets/user_home_category_item.dart';

class UserHomeAllCategoriesList extends StatefulWidget {
  const UserHomeAllCategoriesList({super.key});

  @override
  State<UserHomeAllCategoriesList> createState() => _UserHomeAllCategoriesListState();
}

class _UserHomeAllCategoriesListState extends State<UserHomeAllCategoriesList> {
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
              child: UserHomeCategoryItem(
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
