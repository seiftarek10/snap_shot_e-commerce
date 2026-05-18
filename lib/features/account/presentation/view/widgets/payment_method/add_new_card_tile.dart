import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snap_shot/core/constants/assets.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class AddNewCardTile extends StatelessWidget {
  const AddNewCardTile({
    super.key,
    required this.isExpanded,
    required this.turns,
  });

  final bool isExpanded;
  final Animation<double> turns;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.imagesSvgAddNewCardIcon,
          height: 30.h,
          colorFilter: ColorFilter.mode(
            isExpanded == true
                ? AppColors.instance.white
                : AppColors.instance.black,
            BlendMode.srcIn,
          ),
        ),
        AppSpace.instance.h12,
        Expanded(
          child: Text(
            "Add New Card",
            style: AppTextStyle.instance.text14WBoldBlack.copyWith(
              color: isExpanded == true ? AppColors.instance.white : null,
            ),
          ),
        ),

        RotationTransition(
          turns: turns,
          child: Icon(
            Icons.arrow_forward_ios,
            size: 17.h,
            color: isExpanded == true
                ? AppColors.instance.white
                : AppColors.instance.black,
          ),
        ),
      ],
    );
  }
}
