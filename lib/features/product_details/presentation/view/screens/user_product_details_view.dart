import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/shared_domain_data/all_products/domain/entity/product_entity.dart';
import 'package:snap_shot/features/product_details/presentation/view/widgets/user/user_product_details_bottom_sheet.dart';
import 'package:snap_shot/features/product_details/presentation/view/widgets/user/user_product_details_image.dart';
import 'package:snap_shot/shared/widgets/page_header.dart';

class UserProductDetailsView extends StatelessWidget {
  const UserProductDetailsView({
    super.key,
    required this.productEntity,
    required this.fromHomeScreen,
  });

  final ProductEntity productEntity;
  final bool fromHomeScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppSpace.instance.topPageSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const AppPageTitle(
                pageTitle: 'Product Details',
                arrowBack: true,
              ),
            ),
            AppSpace.instance.v12,
            Expanded(
              child: Stack(
                children: [
                  UserProductDetailsImage(imageUrl: productEntity.imageUrl),
                  UserProductDetailsBottomSheet(
                    product: productEntity,
                    fromHomeScreen: fromHomeScreen,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
