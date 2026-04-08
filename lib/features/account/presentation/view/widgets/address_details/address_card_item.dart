import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/features/account/presentation/view/widgets/address_details/edit_address_form.dart';
import 'package:snap_shot/shared/widgets/app_button.dart';
import 'package:snap_shot/shared/widgets/circle_check_box.dart';

class AddressCardItem extends StatelessWidget {
  const AddressCardItem({super.key, required this.isSelected, required this.onTap});
  final bool isSelected;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.instance.black,
              AppColors.instance.black,
              AppColors.instance.black.withValues(alpha: 0.7),
            ],
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 11,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Home',
                        style: AppTextStyle.instance.text16W600.copyWith(
                          color: AppColors.instance.white,
                        ),
                      ),
                      AppSpace.instance.v4,
                      Text(
                        'Giza',
                        style: AppTextStyle.instance.text14W500Black.copyWith(
                          color: AppColors.instance.white,
                        ),
                      ),
                      AppSpace.instance.v4,
                      Text(
                        'salah abd elbaky ard elwa agouza mohandseen',
                        style: AppTextStyle.instance.text12W200.copyWith(
                          color: AppColors.instance.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: AppCircularCheckBox(isSelected: isSelected),
                ),
              ],
            ),
            AppSpace.instance.v24,
            AppButton(
              buttonTitle: 'Edit Address',
              onPressed: () {
                showDialog(
                  context: context,
      
                  builder: (context) {
                    return const EditAddressForm();
                  },
                );
              },
              outlineButton: true,
            ),
          ],
        ),
      ),
    );
  }
}
