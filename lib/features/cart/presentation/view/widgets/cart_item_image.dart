import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/assets.dart';

class CartItemImage extends StatelessWidget {
  const CartItemImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 2,
      child: Image.asset(
        Assets.imagesPngOnboardingimage2,
        fit: BoxFit.fill,
      ),
    );
  }
}
