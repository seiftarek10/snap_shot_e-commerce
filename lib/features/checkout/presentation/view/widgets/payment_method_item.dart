import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.label,
    required this.isSelected,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:  EdgeInsets.all(15.h),
        decoration: BoxDecoration(
          color: AppColors.instance.black,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: isSelected == true
                    ? AppColors.instance.white
                    : AppColors.instance.black,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.instance.white, width: 3),
              ),
              child: isSelected == true
                  ? Icon(
                      Icons.check,
                      size: 14.h,
                      color: AppColors.instance.black,
                    )
                  : Padding(padding: EdgeInsets.all(7.h)),
            ),
            AppSpace.instance.h12,
            Text(
              label,
              style: AppTextStyle.instance.text16W600.copyWith(
                color: AppColors.instance.white,
              ),
            ),
            const Spacer(),
            Icon(icon, color: AppColors.instance.white, size: 20.h),
          ],
        ),
      ),
    );
  }
}
