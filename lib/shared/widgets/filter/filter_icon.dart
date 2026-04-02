import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snap_shot/core/constants/assets.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/shared/widgets/filter/filter_bottom_sheet_body.dart';

class FilterIcon extends StatefulWidget {
  const FilterIcon({super.key});

  @override
  State<FilterIcon> createState() => _FilterIconState();
}

class _FilterIconState extends State<FilterIcon> {
  bool isFilterActive = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFilterActive = true;
        });
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          useSafeArea: false,
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return const FilterBottomSheetBody();
          },
        ).then((value) {
          setState(() {
            isFilterActive = false;
          });
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: isFilterActive
            ? Transform.scale(scale: 1.7, child: activeFilterIcon())
            : _inActiveFilterIcon(),
      ),
    );
  }

  AnimatedContainer activeFilterIcon() {
    return AnimatedContainer(
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
    );
  }

  SvgPicture _inActiveFilterIcon() {
    return SvgPicture.asset(
      Assets.imagesSvgFilter,
      colorFilter: ColorFilter.mode(AppColors.instance.black, BlendMode.srcIn),
      fit: BoxFit.fill,
    );
  }
}
