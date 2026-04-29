import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/shared/widgets/app_button.dart';
import 'package:snap_shot/shared/widgets/filter/filter_method.dart';
import 'package:snap_shot/shared/widgets/filter/price_range_slider.dart';

class FilterBottomSheetBody extends StatelessWidget {
  const FilterBottomSheetBody({
    super.key,
    required this.prices,
    required this.rating,
    required this.onPressed,
  });
  final void Function(RangeValues) prices;
  final void Function(List<String>) rating;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        color: AppColors.instance.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.r),
          topRight: Radius.circular(50.r),
        ),
      ),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 4.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: AppColors.instance.grey,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            AppSpace.instance.v16,
            Text("Filter", style: AppTextStyle.instance.text22Bold),
            AppSpace.instance.v16,
            FilterMethod(
              filterMethod: "Rating",
              filterOptions: const ["1", "2", "3", "4", "5"],
              rating: rating,
            ),
            AppSpace.instance.v16,
            PriceRangeSlider(values: prices),
            AppSpace.instance.v16,
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    isClicked: false,
                    buttonTitle: 'Clear',
                    outlineButton: true,
                    onPressed: () {},
                  ),
                ),
                AppSpace.instance.h8,
                Expanded(
                  child: AppButton(
                    isClicked: false,
                    buttonTitle: 'Apply',
                    onPressed: () {
                      onPressed();
                      context.pop();
                    },
                  ),
                ),
              ],
            ),
            AppSpace.instance.v16,
          ],
        ),
      ),
    );
  }
}
