import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/features/checkout/presentation/view/widgets/checkout_address.dart';
import 'package:snap_shot/features/checkout/presentation/view/widgets/checkout_header.dart';
import 'package:snap_shot/features/checkout/presentation/view/widgets/checkout_payment_method.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              AppSpace.instance.topPageSpace,
              const CheckoutHeader(),
              AppSpace.instance.v16,
              const CheckoutAddressWidget(),
              AppSpace.instance.v12,
              const Divider(thickness: 2),
              const CheckoutPaymentMethod(),
            ],
          ),
        ),
      ),
    );
  }
}
