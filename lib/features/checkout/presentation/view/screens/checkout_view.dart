import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/shared/widgets/page_header.dart';
import 'package:snap_shot/shared/widgets/price_summery/price_summery_card.dart';
import 'package:snap_shot/features/checkout/presentation/view/widgets/checkout_address.dart';
import 'package:snap_shot/features/checkout/presentation/view/widgets/checkout_payment_method.dart';
import 'package:snap_shot/shared/widgets/app_button.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppSpace.instance.topPageSpace,
                const PageHeader(pageTitle: 'Checkout', arrowBack: true),
                AppSpace.instance.v16,
                const CheckoutAddressWidget(),
                AppSpace.instance.v12,
                const Divider(thickness: 2),
                AppSpace.instance.v4,
                const CheckoutPaymentMethod(),
                AppSpace.instance.v12,
                const Divider(thickness: 2),
                AppSpace.instance.v12,
                const PriceSummeryCard(),
                AppSpace.instance.v16,
                AppButton(
                  isLoading: false,
                  buttonTitle: "Place Order",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
