import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snap_shot/core/constants/assets.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class AddNewCard extends StatelessWidget {
  const AddNewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SvgPicture.asset(Assets.imagesSvgAddNewCardIcon, height: 40.h),
      title: Text(
        "Add Credit Card",
        style: AppTextStyle.instance.text14WBoldBlack,
      ),
      subtitle: Text(
        "Add New Credit Or Debit Card",
        style: AppTextStyle.instance.text12W500.copyWith(
          color: AppColors.instance.white,
        ),
      ),
      trailing: InkWell(
        onTap: () {},
        child: Icon(
          Icons.arrow_forward_ios_outlined,
          color: AppColors.instance.white,
          size: 17.h,
        ),
      ),
    );
  }
}
