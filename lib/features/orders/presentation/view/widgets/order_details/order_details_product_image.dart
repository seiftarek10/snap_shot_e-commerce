

import 'package:flutter/material.dart';

class OrderDetailsProductImage extends StatelessWidget {
  const OrderDetailsProductImage({super.key, required this.productImage});
  final String productImage;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Image.asset(productImage, fit: BoxFit.fitHeight),
    );
  }
}
