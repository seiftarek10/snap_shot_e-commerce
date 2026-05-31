import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/features/cart/presentation/manager/get_cart_cubit/get_cart_proudcts_cubit.dart';
import 'package:snap_shot/shared/widgets/price_summery/price_summery_card.dart';

class CartViewPriceSection extends StatelessWidget {
  const CartViewPriceSection({super.key});

  @override
  Widget build(BuildContext context) {
    GetCartProudctsCubit cartCubit = context.read<GetCartProudctsCubit>();
    return BlocBuilder<GetCartProudctsCubit, GetCartProudctsState>(
      builder: (context, state) {
        if (state is CartProudctsLoadded) {
          if (state.products.isEmpty) {
            return const SizedBox.shrink();
          }
          return PriceSummeryCard(
            productsCost: cartCubit.productsCost,
            deliveryCost: cartCubit.delivery,
            totalCost: double.parse(
              (cartCubit.productsCost + cartCubit.delivery).toStringAsFixed(2),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
