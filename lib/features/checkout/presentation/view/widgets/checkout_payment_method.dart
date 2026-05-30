import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/features/checkout/presentation/manager/checkout/checkout_cubit.dart';
import 'package:snap_shot/features/checkout/presentation/view/widgets/payment_method_item.dart';

class CheckoutPaymentMethod extends StatefulWidget {
  const CheckoutPaymentMethod({super.key});

  @override
  State<CheckoutPaymentMethod> createState() => _CheckoutPaymentMethodState();
}

class _CheckoutPaymentMethodState extends State<CheckoutPaymentMethod> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Payment Method", style: AppTextStyle.instance.text20Bold),
        AppSpace.instance.v12,

        PaymentMethodItem(
          label: 'Debit / Credit Card',
          icon: Icons.credit_card,
          isSelected: currentIndex == 0,
          onTap: () {
            setState(() {
              currentIndex = 0;
            });
            context.read<CheckoutCubit>().updatePaymentMethodIndex(0);
          },
        ),
        AppSpace.instance.v12,

        PaymentMethodItem(
          label: 'Cash On Delivery',
          icon: Icons.money,
          isSelected: currentIndex == 1,
          onTap: () {
            setState(() {
              currentIndex = 1;
            });
            context.read<CheckoutCubit>().updatePaymentMethodIndex(1);
          },
        ),
      ],
    );
  }
}
