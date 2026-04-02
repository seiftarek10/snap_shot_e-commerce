
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/shared/widgets/filter/filter_item.dart';

class FilterMethod extends StatelessWidget {
  const FilterMethod({
    super.key,
    required this.filterMethod,
    required this.filterOptions,
  });

  final String filterMethod;
  final List<String> filterOptions;

  @override
  Widget build(BuildContext context) {
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
            return FilterItme(title: filterOptions[index]);
          }),
        ),
      ],
    );
  }
}