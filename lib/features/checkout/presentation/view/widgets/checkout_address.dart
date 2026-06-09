import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/fonts.dart';

class CheckoutAddressWidget extends StatelessWidget {
  const CheckoutAddressWidget({super.key, required this.address});
  final String address;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Address Details", style: AppTextStyle.instance.text18W700),
        AppSpace.instance.v16,
        Row(
          children: [
            Icon(Icons.location_on_outlined, size: 25.h),
            AppSpace.instance.h12,
            Expanded(
              child: Text(
                address,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.instance.text14W500Black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
