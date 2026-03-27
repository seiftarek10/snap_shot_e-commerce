import 'package:flutter/material.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 2,
            // color: AppColors.instance.,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "OR",
            style: AppTextStyle.instance.text12W200.copyWith(
              color: AppColors.instance.grey,
            ),
          ),
        ),
        Expanded(child: Divider(thickness: 2)),
      ],
    );
  }
}
