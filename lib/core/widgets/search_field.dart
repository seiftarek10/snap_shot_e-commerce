import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snap_shot/core/constants/assets.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/widgets/app_text_filed.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  bool hasFocus = false;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      hintText: 'Search',
      onSaved: (value) {},
      onFocusChange: (value) {
        setState(() {
          hasFocus = value;
        });
      },
      keyboardType: TextInputType.text,

      prefix: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: SvgPicture.asset(
          Assets.imagesSvgSearch,
          colorFilter: ColorFilter.mode(
            hasFocus ? AppColors.instance.black : Colors.grey,
            BlendMode.srcIn,
          ),
          fit: BoxFit.fill,
        ),
      ),
      suffix: Padding(
        padding: EdgeInsets.only(right: 12.w),

        child: SvgPicture.asset(
          Assets.imagesSvgFilter,
          colorFilter: ColorFilter.mode(
            hasFocus ? AppColors.instance.black : Colors.grey,
            BlendMode.srcIn,
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
