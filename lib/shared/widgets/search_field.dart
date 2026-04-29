import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snap_shot/core/constants/assets.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/utils/validator.dart';
import 'package:snap_shot/shared/widgets/app_text_filed.dart';
import 'package:snap_shot/shared/widgets/filter/filter_icon.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key, required this.onChanged});
  final void Function(String) onChanged;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  bool hasFocus = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: AppTextField(
            onChanged: widget.onChanged,
            validator: (value) {
              return ValidationForm.nullOrEpmty(value);
            },
            hintText: 'Search',
            onSaved: (value) {},
            onFocusChange: (value) {
              setState(() {
                hasFocus = value;
              });
            },
            keyboardType: TextInputType.text,

            prefix: _buildPrefixIcon(),
          ),
        ),
        AppSpace.instance.h16,
        const Expanded(child: FilterIcon()),
      ],
    );
  }

  Widget _buildPrefixIcon() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: SvgPicture.asset(
        Assets.imagesSvgSearch,
        colorFilter: ColorFilter.mode(
          hasFocus ? AppColors.instance.black : Colors.grey,
          BlendMode.srcIn,
        ),
        fit: BoxFit.fill,
      ),
    );
  }
}
