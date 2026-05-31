import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/di/sl.dart';
import 'package:snap_shot/features/cart/presentation/manager/get_cart_cubit/get_cart_proudcts_cubit.dart';
import 'package:snap_shot/features/cart/presentation/view/widgets/cart_checkout_builder_button.dart';
import 'package:snap_shot/features/cart/presentation/view/widgets/cart_view_price_section.dart';
import 'package:snap_shot/features/home/presentation/manager/cart_cubit/user_cart_manager_cubit.dart';
import 'package:snap_shot/shared/widgets/page_header.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';
import 'package:snap_shot/features/cart/presentation/view/widgets/all_cart_items_list.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<GetCartProudctsCubit>()..getCartProudcts(),
        ),
        BlocProvider(create: (context) => sl<UserCartManegerCubit>()),
      ],
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
            const SliverToBoxAdapter(child: CartViewPriceSection()),
            const SliverToBoxAdapter(child: CartCheckoutButtonBuilder()),
          ],
        ),
      ),
    );
  }
}
