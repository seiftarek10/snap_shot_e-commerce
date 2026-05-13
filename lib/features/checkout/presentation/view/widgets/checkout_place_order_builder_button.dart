import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/features/checkout/presentation/manager/checkout/checkout_cubit.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';
import 'package:snap_shot/shared/widgets/app_button.dart';

class PlaceOrderBuilderButton extends StatelessWidget {
  const PlaceOrderBuilderButton({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      buildWhen: (previous, current) {
        return current is MakeOrderLoading ||
            current is MakeOrderSuccess ||
            current is MakeOrderFailure;
      },
      builder: (context, state) {
        return AppButton(
          isLoading: state is MakeOrderLoading,
          buttonTitle: "Place Order",
          onPressed: () async {
            await context.read<CheckoutCubit>().makeOrder(prodcuts: products);
          },
        );
      },
    );
  }
}
