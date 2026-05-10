import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_shot/core/di/sl.dart';
import 'package:snap_shot/core/routing/routes.dart';
import 'package:snap_shot/features/cart/presentation/manager/get_cart_cubit/get_cart_proudcts_cubit.dart';
import 'package:snap_shot/shared/widgets/page_header.dart';
import 'package:snap_shot/shared/widgets/app_button.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';
import 'package:snap_shot/features/cart/presentation/view/widgets/all_cart_items_list.dart';
import 'package:snap_shot/shared/widgets/price_summery/price_summery_card.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetCartProudctsCubit>()..getCartProudcts(),
      child: PagePadding(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              sliver: const SliverToBoxAdapter(
                child: PageHeader(pageTitle: 'Cart', arrowBack: false),
              ),
            ),
            const AllCartItemSliverList(),
            const SliverToBoxAdapter(child: PriceSummeryCard()),
            SliverToBoxAdapter(
              child: AppButton(
                isLoading: false,
                buttonTitle: 'Checkout',
                onPressed: () {
                  context.push(Routes.instance.checkout);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
