import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snap_shot/core/constants/assets.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class CreditCardInfo extends StatelessWidget {
  const CreditCardInfo({
    super.key,
    required this.title,
    required this.expireDate,
    required this.isSelected,
    required this.onTap,
  });
  final String title, expireDate;
  final bool isSelected;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SvgPicture.asset(
          Assets.imagesSvgMastercard,
          height: 40.h,
          fit: BoxFit.cover,
        ),
        title: Text(title, style: AppTextStyle.instance.text14WBoldBlack),
        subtitle: Text(expireDate, style: AppTextStyle.instance.text12W500),
        trailing: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isSelected == true ? AppColors.instance.white : null,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.instance.white, width: 3),
          ),
          child: isSelected == true
              ? Icon(Icons.check, size: 14.h, color: AppColors.instance.black)
              : Padding(padding: EdgeInsets.all(7.h)),
        ),
      ),
    );
  }
}
