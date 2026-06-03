import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/core/shared_domain_data/all_products/domain/entity/product_entity.dart';
import 'package:snap_shot/features/checkout/presentation/manager/checkout/checkout_cubit.dart';
import 'package:snap_shot/shared/widgets/app_button.dart';

class PlaceOrderBuilderButton extends StatelessWidget {
  const PlaceOrderBuilderButton({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      buildWhen: (previous, current) {
        return current is RequestPaymentSheet ||
            current is PaymentComplete ||
            current is PaymentFailed ||
            current is MakeOrderLoading ||
            current is MakeOrderFailure ||
            current is MakeOrderSuccess;
      },
      builder: (context, state) {
        return AppButton(
          isLoading: state is RequestPaymentSheet || state is MakeOrderLoading,
          buttonTitle: "Place Order",
          onPressed: () async {
            final checkoutCubit = context.read<CheckoutCubit>();
            checkoutCubit.currentPaymentIndex == 0
                ? await checkoutCubit.makePayment()
                : await checkoutCubit.makeOrder(
                    prodcuts: products,
                    isPaid: false,
                  );
          },
        );
      },
    );
  }
}
