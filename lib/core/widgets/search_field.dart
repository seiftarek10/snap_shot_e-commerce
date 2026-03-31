import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snap_shot/core/constants/assets.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/widgets/app_text_filed.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key, required this.onTapFilter});
  final Function() onTapFilter;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  bool hasFocus = false;
  bool filterTapped = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: AppTextField(
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
        Expanded(child: _buildFilterIcon()),
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

  Widget _buildFilterIcon() {
    return GestureDetector(
      onTap: () {
        setState(() {
          filterTapped = !filterTapped;
        });
        widget.onTapFilter();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: filterTapped
            ? Transform.scale(
                scale: 1.7,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOutCubicEmphasized,
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                    color: AppColors.instance.black,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: SvgPicture.asset(
                    Assets.imagesSvgFilter,
                    colorFilter: ColorFilter.mode(
                      AppColors.instance.white,
                      BlendMode.srcIn,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              )
            : SvgPicture.asset(
                Assets.imagesSvgFilter,
                colorFilter: ColorFilter.mode(
                  AppColors.instance.black,
                  BlendMode.srcIn,
                ),
                fit: BoxFit.fill,
              ),
      ),
    );
  }
}
