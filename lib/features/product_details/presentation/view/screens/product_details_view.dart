import 'package:flutter/material.dart';
import 'package:snap_shot/core/routing/app_router.dart';
import 'package:snap_shot/core/shared_domain_data/all_products/domain/entity/product_entity.dart';
import 'package:snap_shot/features/product_details/presentation/view/screens/owner_product_details_view.dart';
import 'package:snap_shot/features/product_details/presentation/view/screens/user_product_details_view.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({
    super.key,
    required this.role,
    required this.productEntity,
    required this.fromHomeScreen,
  });
  final ProductEntity productEntity;
  final bool fromHomeScreen;

  final Role role;
  @override
  Widget build(BuildContext context) {
    switch (role) {
      case Role.user:
        return UserProductDetailsView(
          productEntity: productEntity,
          fromHomeScreen: fromHomeScreen,
        );
      case Role.owner:
        return const OwnerProductDetailsView();
      case Role.staff:
        return const Scaffold();
      default:
        return const Scaffold();
    }
  }
}
