import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/shared/widgets/arrow_back.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
    required this.pageTitle,
    required this.arrowBack,
  });
  final String pageTitle;
  final bool arrowBack;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        arrowBack == true ? const ArrowBackWidget() : const SizedBox.shrink(),
        Expanded(
          child: Center(
            child: Text(
              pageTitle,
              style: AppTextStyle.instance.text22Bold.copyWith(fontSize: 24.sp),
            ),
          ),
        ),
      ],
    );
  }
}
