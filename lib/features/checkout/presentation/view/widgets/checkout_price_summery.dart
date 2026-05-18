import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/features/checkout/presentation/manager/checkout/checkout_cubit.dart';
import 'package:snap_shot/shared/widgets/price_summery/price_summery_card.dart';

class CheckoutPriceSummery extends StatelessWidget {
  const CheckoutPriceSummery({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutCubit checkoutCubit = context.read<CheckoutCubit>();
    return PriceSummeryCard(
      productsCost: checkoutCubit.productsCost,
      deliveryCost: checkoutCubit.deliveryCost,
      totalCost: checkoutCubit.productsCost + checkoutCubit.deliveryCost,
    );
  }
}
