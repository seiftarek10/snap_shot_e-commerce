import 'package:flutter/material.dart';

import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/shared/widgets/page_header.dart';
import 'package:snap_shot/features/category/presentation/view/widgets/all_products_category.dart';

import 'package:snap_shot/shared/widgets/page_padding.dart';

class OwnerCategoryProductsView extends StatelessWidget {
  const OwnerCategoryProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PagePadding(
          child: Column(
            children: [
              AppSpace.instance.topPageSpace,
              const PageHeader(pageTitle: "Category Name", arrowBack: true),
              AppSpace.instance.v12,
              const Expanded(child: OwnerAllProductsCategory()),
            ],
          ),
        ),
      ),
    );
  }
}
