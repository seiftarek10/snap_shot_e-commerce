
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/features/home/presentation/view/widgets/user_widgets/search/filter_item.dart';

class FilterMethod extends StatelessWidget {
  const FilterMethod({
    super.key,
    required this.filterMethod,
    required this.filterOptions,
    required this.rating,
  });

  final String filterMethod;
  final List<String> filterOptions;
  final ValueChanged<List<String>> rating;

  @override
  Widget build(BuildContext context) {
    List<String> allRating = [];

    return Column(
      children: [
        Text(
          filterMethod,
          style: AppTextStyle.instance.text16W400.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.instance.grey,
          ),
        ),
        AppSpace.instance.v8,
        Wrap(
          spacing: 10.w,
          runSpacing: 10.h,

          children: List.generate(filterOptions.length, (index) {
            return FilterItme(
              onTap: () {
                String value = filterOptions[index];
                if (allRating.contains(value)) {
                  allRating.remove(filterOptions[index]);
                  rating(allRating);
                } else {
                  allRating.add(filterOptions[index]);
                  rating(allRating);
                }
              
              },
              title: filterOptions[index],
            );
          }),
        ),
      ],
    );
  }
}
