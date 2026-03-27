import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.platForm, required this.icon, required this.iconColor});

  final String platForm;
  final FaIconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45.h,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 2, color: AppColors.instance.grey),
        ),
        onPressed: () {},
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 28.w),
              child: FaIcon(icon, size: 26.h, color: iconColor),
            ),

            Expanded(
              child: Center(
                child: Text(
                  'Continue with $platForm',
                  style: AppTextStyle.instance.text12W500Black,
                ),
              ),
            ),
            AppSpace.instance.h16,
          ],
        ),
      ),
    );
  }
}
