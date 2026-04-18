import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/routing/routes.dart';
import 'package:snap_shot/shared/widgets/page_header.dart';
import 'package:snap_shot/shared/widgets/app_button.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';
import 'package:snap_shot/features/cart/presentation/view/widgets/all_cart_items_list.dart';
import 'package:snap_shot/shared/widgets/price_summery/price_summery_card.dart';

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
                const PageHeader(pageTitle: 'Cart', arrowBack: false),
                AppSpace.instance.v12,
              ],
            ),
          ),
          const AllCartItemSliverList(),
          const SliverToBoxAdapter(child: PriceSummeryCard()),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppButton(
                  buttonTitle: 'Checkout',
                  onPressed: () {
                    context.push(Routes.instance.checkout);
                  },
                ),
                AppSpace.instance.v12,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
