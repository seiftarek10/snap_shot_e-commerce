import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/shared/widgets/counter_row.dart';

class UserBottomSheetCounterWidget extends StatelessWidget {
  const UserBottomSheetCounterWidget({super.key, required this.counterListner, required this.counter});

  final ValueChanged<int> counterListner;
  final int counter;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 20.w),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.instance.greyLight, width: 3),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: CounterWithoutDecoration(
          counter: counter,
          counterListner: counterListner,
        ),
      ),
    );
  }
}
