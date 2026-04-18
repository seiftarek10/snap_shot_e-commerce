import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/features/product_details/presentation/view/widgets/user/user_product_details_bottom_sheet.dart';
import 'package:snap_shot/features/product_details/presentation/view/widgets/user/user_product_details_image.dart';
import 'package:snap_shot/shared/widgets/page_header.dart';

class UserProductDetailsView extends StatelessWidget {
  const UserProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppSpace.instance.topPageSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const PageHeader(
                pageTitle: 'Product Details',
                arrowBack: true,
              ),
            ),
            AppSpace.instance.v12,
            const Expanded(
              child: Stack(
                children: [
                  UserProductDetailsImage(),
                  UserProductDetailsBottomSheet(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
