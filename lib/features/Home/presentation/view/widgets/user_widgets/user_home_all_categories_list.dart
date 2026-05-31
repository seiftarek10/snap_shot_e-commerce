import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/features/home/presentation/manager/get_products_cubit/get_all_products_cubit.dart';
import 'package:snap_shot/features/home/presentation/view/widgets/user_widgets/user_home_category_item.dart';

class UserHomeAllCategoriesList extends StatefulWidget {
  const UserHomeAllCategoriesList({super.key, required this.categories});
  final List<String> categories;

  @override
  State<UserHomeAllCategoriesList> createState() =>
      _UserHomeAllCategoriesListState();
}

class _UserHomeAllCategoriesListState extends State<UserHomeAllCategoriesList> {
  int currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length + 1,
        itemBuilder: (context, index) {
          final bool isAllButton = index == 0;
          final String categoryName = isAllButton
              ? 'ALL'
              : widget.categories[index - 1];
          final bool isSelected = isAllButton
              ? currentIndex == -1
              : currentIndex == index - 1;

          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = isAllButton ? -1 : index - 1;
                context.read<UserHomeProudctsCubit>().changeCategory(
                  category: isAllButton ? 'All' : categoryName,
                );
              });
            },
            child: Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: UserHomeCategoryItem(
                isSelected: isSelected,
                title: categoryName,
              ),
            ),
          );
        },
      ),
    );
  }
}
