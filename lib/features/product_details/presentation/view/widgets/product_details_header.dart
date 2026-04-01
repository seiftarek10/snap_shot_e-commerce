import 'package:flutter/material.dart';
import 'package:snap_shot/core/widgets/arrow_back.dart';
import 'package:snap_shot/core/widgets/page_title.dart';

class ProductDetailsHeader extends StatelessWidget {
  const ProductDetailsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        ArrowBackWidget(),
        Expanded(
          child: Center(
            child: PageTitle(pageTitle: 'Product Details'),
          ),
        ),
      ],
    );
  }
}
