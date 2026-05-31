import 'package:flutter/material.dart';
import 'package:snap_shot/core/style/fonts.dart';

class UserProductPriceText extends StatelessWidget {
  const UserProductPriceText({super.key, required this.price});
  final String price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Price", style: AppTextStyle.instance.text20W500),
        Text(
          r"$"
          "$price",
          style: AppTextStyle.instance.text22Bold,
        ),
      ],
    );
  }
}
