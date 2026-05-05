import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/fonts.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    super.key,
    required this.errMessage,
    required this.onTap,
  });

  final String errMessage;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.replay_rounded, size: 30.h),
          Text(
            errMessage,
            textAlign: TextAlign.center,
            style: AppTextStyle.instance.text18W700,
          ),
        ],
      ),
    );
  }
}
