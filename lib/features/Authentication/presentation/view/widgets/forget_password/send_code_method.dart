import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/features/authentication/data/Models/send_code_options_data_model.dart';

class SendCodeMethod extends StatelessWidget {
  const SendCodeMethod({
    super.key,
    required this.sendCodeMethodModel,
    required this.isSelected,
  });
  final SendCodeMethodModel sendCodeMethodModel;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.instance.blackOpacity : null,
        border: Border.all(
          color: isSelected
              ? AppColors.instance.black
              : AppColors.instance.greyLight,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                sendCodeMethodModel.icon,
                height: 35.h,
                colorFilter: ColorFilter.mode(
                  isSelected
                      ? AppColors.instance.black
                      : AppColors.instance.grey,
                  BlendMode.srcIn,
                ),
              ),
              Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.instance.black : null,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? AppColors.instance.black
                        : AppColors.instance.grey,
                    width: 4,
                  ),
                ),
                child: Icon(
                  Icons.check,
                  size: 14.h,
                  color: isSelected ? AppColors.instance.white : null,
                ),
              ),
            ],
          ),
          AppSpace.instance.v16,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sendCodeMethodModel.method,
                style: AppTextStyle.instance.text18W500.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              AppSpace.instance.v4,
              Text(
                "Your ${sendCodeMethodModel.method} : ${sendCodeMethodModel.info}",
                style: AppTextStyle.instance.text11W200grey,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
