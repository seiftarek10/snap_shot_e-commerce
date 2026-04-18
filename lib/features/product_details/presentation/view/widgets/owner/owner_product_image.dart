
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/assets.dart';
import 'package:snap_shot/core/style/colors.dart';

class OwnerProductDetailsImage extends StatelessWidget {
  const OwnerProductDetailsImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 180.h,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.instance.lighterGrey,
          ),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(
              Assets.imagesPngOnboardingimage2,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 10.h,
          right: 10,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_a_photo,
              size: 30.h,
              color: AppColors.instance.blueGrey,
            ),
          ),
        ),
      ],
    );
  }
}
