import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class UserBottomSheetCounterWidget extends StatefulWidget {
  const UserBottomSheetCounterWidget({super.key, required this.counterListner});

  final ValueChanged<int> counterListner;

  @override
  State<UserBottomSheetCounterWidget> createState() =>
      _UserBottomSheetCounterWidgetState();
}

class _UserBottomSheetCounterWidgetState
    extends State<UserBottomSheetCounterWidget> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 20.w),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.instance.greyLight, width: 3),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                counter++;
                widget.counterListner(counter);
                setState(() {});
              },
              child: Icon(Icons.add, size: 20.h),
            ),
            Text(counter.toString(), style: AppTextStyle.instance.text20W500),
            InkWell(
              onTap: () {
                if (counter > 1) {
                  counter--;
                  widget.counterListner(counter);
                  setState(() {});
                }
              },
              child: Icon(Icons.remove, size: 20.h),
            ),
          ],
        ),
      ),
    );
  }
}
