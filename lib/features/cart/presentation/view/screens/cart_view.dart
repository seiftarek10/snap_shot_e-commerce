import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/widgets/page_padding.dart';
import 'package:snap_shot/core/widgets/page_title.dart';
import 'package:snap_shot/features/cart/presentation/view/widgets/all_cart_items_list.dart';
import 'package:snap_shot/features/cart/presentation/view/widgets/price_summery_card.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return PagePadding(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                AppSpace.instance.topPageSpace,
                const PageTitle(pageTitle: 'Cart'),
                AppSpace.instance.v12,
              ],
            ),
          ),
          const AllCartItemSliverList(),
          const SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 36),
            sliver: SliverToBoxAdapter(child: PriceSummeryCard())),
        ],
      ),
    );
  }
}
