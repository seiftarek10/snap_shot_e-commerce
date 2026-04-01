import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/core/widgets/app_button.dart';
import 'package:snap_shot/core/widgets/filter/filter_method.dart';
import 'package:snap_shot/core/widgets/filter/price_range_slider.dart';

class FilterBottomSheetBody extends StatelessWidget {
  const FilterBottomSheetBody({super.key});

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
            AppSpace.instance.v24,
            const FilterMethod(
              filterMethod: "Year",
              filterOptions: [
                "2022",
                "2021",
                "2020",
                "2019",
                "2018",
                "2017",
                "2016",
                "2020",
                "2019",
     
              ],
            ),
            AppSpace.instance.v16,
            const FilterMethod(
              filterMethod: "Rating",
              filterOptions: ["1", "2", "3", "4", "5"],
            ),
            AppSpace.instance.v16,
            const PriceRangeSlider(),
            AppSpace.instance.v16,
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    buttonTitle: 'Clear',
                    outlineButton: true,
                    onPressed: () {},
                  ),
                ),
                AppSpace.instance.h8,
                Expanded(
                  child: AppButton(buttonTitle: 'Apply', onPressed: () {}),
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
