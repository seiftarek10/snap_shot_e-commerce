
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/colors.dart';

class ProductDetailsBottomSection extends StatelessWidget {
  const ProductDetailsBottomSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.bottomCenter,
      child: FractionallySizedBox(
        heightFactor: 0.4,
        widthFactor: 1,
    
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.instance.lighterGrey,
                offset: const Offset(0, -10),
                blurRadius: 5,
              ),
            ],
            color: AppColors.instance.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
            ),
          ),
        ),
      ),
    );
  }
}

