import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class PhoneOrEmailWidget extends StatefulWidget {
  const PhoneOrEmailWidget({super.key, required this.choise});
  final ValueChanged<String> choise;
  @override
  State<PhoneOrEmailWidget> createState() => _PhoneOrEmailWidgetState();
}

class _PhoneOrEmailWidgetState extends State<PhoneOrEmailWidget> {
  late int currentIndex;
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
      decoration: BoxDecoration(
        color: AppColors.instance.black,
        borderRadius: BorderRadius.circular(22.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          2,
          (index) => Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                  widget.choise(
                    index == 0 ? 'Email'.toLowerCase() : 'Phone'.toLowerCase(),
                  );
                });
              },

              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn,
                decoration: BoxDecoration(
                  color: index == currentIndex
                      ? AppColors.instance.white
                      : AppColors.instance.black,
                  borderRadius: BorderRadius.circular(22.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.h),
                  child: Text(
                    index == 0 ? 'Email' : 'Phone',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.instance.text12W200.copyWith(
                      color: index == currentIndex
                          ? AppColors.instance.black
                          : AppColors.instance.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
