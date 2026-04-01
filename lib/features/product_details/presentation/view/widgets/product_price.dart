
import 'package:flutter/material.dart';
import 'package:snap_shot/core/style/fonts.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text("Price",style: AppTextStyle.instance.text20W500),
      Text(r"$66.22",style: AppTextStyle.instance.text22Bold),
    
    ],);
  }
}