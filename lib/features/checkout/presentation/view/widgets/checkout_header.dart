import 'package:flutter/material.dart';
import 'package:snap_shot/shared/widgets/arrow_back.dart';
import 'package:snap_shot/shared/widgets/page_title.dart';

class CheckoutHeader extends StatelessWidget {
  const CheckoutHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        ArrowBackWidget(),
        Expanded(child: Center(child: PageTitle(pageTitle: "Checkout")))
      ],
    );
  }
}