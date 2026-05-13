import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_shot/core/routing/routes.dart';
import 'package:snap_shot/features/cart/presentation/manager/get_cart_cubit/get_cart_proudcts_cubit.dart';
import 'package:snap_shot/shared/widgets/app_button.dart';

class CartCheckoutButtonBuilder extends StatelessWidget {
  const CartCheckoutButtonBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCartProudctsCubit, GetCartProudctsState>(
      builder: (context, state) {
        if (state is CartProudctsLoadded) {
          if (state.products.isEmpty) {
            return const SizedBox.shrink();
          }
          return AppButton(
            isLoading: false,
            buttonTitle: 'Checkout',
            onPressed: () {
              context.push(
                Routes.instance.checkout,
                extra: context.read<GetCartProudctsCubit>().prodcuts,
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
