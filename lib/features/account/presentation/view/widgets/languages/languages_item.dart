import 'package:flutter/material.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/shared/widgets/circle_check_box.dart';

class LanguagesItem extends StatelessWidget {
  const LanguagesItem({super.key, required this.isSelected, required this.language});
  final bool isSelected;
  final String language;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(language, style: AppTextStyle.instance.text16W400),
          AppCircularCheckBox(
            isSelected: isSelected,
            backgroundColor: AppColors.instance.black,
            borderColor: AppColors.instance.black,
            iconColor: AppColors.instance.white,
          ),
        ],
      ),
    );
  }
}