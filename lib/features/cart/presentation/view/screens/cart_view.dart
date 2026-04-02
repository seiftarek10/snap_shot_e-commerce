import 'package:flutter/material.dart';

import 'package:snap_shot/core/constants/space.dart';

import 'package:snap_shot/core/widgets/page_padding.dart';
import 'package:snap_shot/core/widgets/page_title.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return PagePadding(
      child: Column(
        children: [
          AppSpace.instance.topPageSpace,
          const PageTitle(pageTitle: 'Cart'),
          AppSpace.instance.v12,
         
        ],
      ),
    );
  }
}
