import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/features/product_details/presentation/view/widgets/product_details_bottom_section.dart';
import 'package:snap_shot/features/product_details/presentation/view/widgets/product_details_header.dart';
import 'package:snap_shot/features/product_details/presentation/view/widgets/product_details_image.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppSpace.instance.topPageSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const ProductDetailsHeader(),
            ),
            AppSpace.instance.v12,
            const Expanded(
              child: Stack(
                children: [
                  ProductDetailsImage(),
                  ProductDetailsBottomSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
