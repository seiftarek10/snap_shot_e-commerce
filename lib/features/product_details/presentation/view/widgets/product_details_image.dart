
import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/assets.dart';

class ProductDetailsImage extends StatelessWidget {
  const ProductDetailsImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.topCenter,
      child: FractionallySizedBox(
        heightFactor: 0.65,
        widthFactor: 1,
        child: Image.asset(
          Assets.imagesPngOnboardingimage2,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
