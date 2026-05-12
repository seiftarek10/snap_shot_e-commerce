import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_shot/core/routing/routes.dart';
import 'package:snap_shot/features/cart/presentation/manager/get_cart_cubit/get_cart_proudcts_cubit.dart';
import 'package:snap_shot/shared/widgets/app_button.dart';

class CartCheckoutButton extends StatelessWidget {
  const CartCheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCartProudctsCubit, GetCartProudctsState>(
      builder: (context, state) {
        if (state is CartProudctsLoadded) {
          return AppButton(
            isLoading: false,
            buttonTitle: 'Checkout',
            onPressed: () {
              context.push(Routes.instance.checkout);
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
