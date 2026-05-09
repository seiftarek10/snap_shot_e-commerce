import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/core/utils/validator.dart';
import 'package:snap_shot/shared/widgets/app_button.dart';
import 'package:snap_shot/shared/widgets/app_text_filed.dart';

class EditAddressForm extends StatelessWidget {
  const EditAddressForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20.r),
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.all(30.r),
        child: AnimatedContainer(
          padding: const EdgeInsets.all(40),
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOutCubicEmphasized,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.black,
          ),
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextField(
                  validator: (value) {
                    return ValidationForm.nullOrEpmty(value);
                  },
                  hintText: "Enter place name (e.g., Home, Work)",
                  onSaved: (place) {},
                  keyboardType: TextInputType.text,
                  foucsedBorderColor: AppColors.instance.white,
                  borderRadius: 30,
                  filedTextStyle: AppTextStyle.instance.textFieldStyle.copyWith(
                    color: AppColors.instance.white,
                    fontSize: 12.sp,
                  ),
                ),
                AppSpace.instance.v20,
                AppTextField(
                  validator: (value) {
                    return ValidationForm.nullOrEpmty(value);
                  },
                  hintText: "Street, area or landmark",
                  onSaved: (place) {},
                  keyboardType: TextInputType.text,
                  foucsedBorderColor: AppColors.instance.white,
                  filedTextStyle: AppTextStyle.instance.textFieldStyle.copyWith(
                    color: AppColors.instance.white,
                    fontSize: 12.sp,
                  ),
                  borderRadius: 30,
                ),
                AppSpace.instance.v20,
                AppTextField(
                  validator: (value) {
                    return ValidationForm.nullOrEpmty(value);
                  },
                  hintText:
                      "Additional details (apartment, floor, landmarks, notes)",
                  onSaved: (place) {},
                  keyboardType: TextInputType.text,
                  filedTextStyle: AppTextStyle.instance.textFieldStyle.copyWith(
                    color: AppColors.instance.white,
                    fontSize: 12.sp,
                  ),
                  foucsedBorderColor: AppColors.instance.white,
                  borderRadius: 30,
                ),
                AppSpace.instance.v24,
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        isLoading: false,
                        buttonTitle: 'Cancel',
                        onPressed: () {
                          context.pop();
                        },
                        // outlineButton: true,
                      ),
                    ),
                    AppSpace.instance.h12,
                    Expanded(
                      child: AppButton(
                        isLoading: false,
                        buttonTitle: 'Edit',
                        onPressed: () {},
                        // outlineButton: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
