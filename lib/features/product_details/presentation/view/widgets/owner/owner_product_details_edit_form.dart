import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/utils/validator.dart';
import 'package:snap_shot/shared/widgets/app_button.dart';
import 'package:snap_shot/shared/widgets/app_text_filed.dart';

class OwnerProductDetailsEditForm extends StatelessWidget {
  const OwnerProductDetailsEditForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          AppTextField(
               validator: (value) {
                    return ValidationForm.nullOrEpmty(value);
                  },
            hintText: 'Product Name',
            onSaved: (value) {},
            keyboardType: TextInputType.text,
          ),
          AppSpace.instance.v12,
          AppTextField(
               validator: (value) {
                    return ValidationForm.nullOrEpmty(value);
                  },
            hintText: 'Product Price',
            onSaved: (value) {},
            keyboardType: TextInputType.number,
          ),
          AppSpace.instance.v12,
          AppTextField(
               validator: (value) {
                    return ValidationForm.nullOrEpmty(value);
                  },
            hintText: 'Product Description',
            onSaved: (value) {},
            maxLines: 6,
            keyboardType: TextInputType.text,
          ),
          AppSpace.instance.v32,
          Row(
            children: [
              Expanded(
                child: AppButton(
                  buttonTitle: 'Delete',
                  onPressed: () {},
                  backgroundColor: const Color.fromARGB(255, 137, 23, 15),
                ),
              ),
              AppSpace.instance.h16,
              Expanded(
                child: AppButton(
                  buttonTitle: 'Save Changes',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
