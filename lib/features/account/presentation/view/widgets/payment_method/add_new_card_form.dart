import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/core/utils/validator.dart';
import 'package:snap_shot/shared/widgets/app_button.dart';
import 'package:snap_shot/shared/widgets/app_text_filed.dart';

class AddNewCardForm extends StatelessWidget {
  const AddNewCardForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextField(
               validator: (value) {
                    return ValidationForm.nullOrEpmty(value);
                  },
            hintText: 'Card Number',
            keyboardType: TextInputType.text,
            foucsedBorderColor: AppColors.instance.white,
            filedTextStyle: AppTextStyle.instance.textFieldStyle.copyWith(
              color: AppColors.instance.white,
            ),
            onSaved: (v) {},
          ),
          AppSpace.instance.v12,
          AppTextField(
               validator: (value) {
                    return ValidationForm.nullOrEpmty(value);
                  },
            hintText: 'Card Holder',
            keyboardType: TextInputType.text,
            foucsedBorderColor: AppColors.instance.white,
            filedTextStyle: AppTextStyle.instance.textFieldStyle.copyWith(
              color: AppColors.instance.white,
            ),
            onSaved: (v) {},
          ),
          AppSpace.instance.v12,
          Row(
            children: [
              Expanded(
                
                child: AppTextField(   validator: (value) {
                    return ValidationForm.nullOrEpmty(value);
                  },

                  hintText: 'Exp Date',
                  keyboardType: TextInputType.text,
                  foucsedBorderColor: AppColors.instance.white,
                  filedTextStyle: AppTextStyle.instance.textFieldStyle.copyWith(
                    color: AppColors.instance.white,
                  ),
                  onSaved: (v) {},
                ),
              ),
              AppSpace.instance.h12,
              Expanded(
                child: AppTextField(
                     validator: (value) {
                    return ValidationForm.nullOrEpmty(value);
                  },
                  hintText: 'CCV',
                  keyboardType: TextInputType.text,
                  foucsedBorderColor: AppColors.instance.white,
                  filedTextStyle: AppTextStyle.instance.textFieldStyle.copyWith(
                    color: AppColors.instance.white,
                  ),
                  onSaved: (v) {},
                ),
              ),
            ],
          ),
          AppSpace.instance.v12,
          AppButton(buttonTitle: 'Save Card', onPressed: () {}),
        ],
      ),
    );
  }
}
