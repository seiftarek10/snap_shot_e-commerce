import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/di/sl.dart';
import 'package:snap_shot/core/routing/routes.dart';
import 'package:snap_shot/core/utils/show_snack_bar.dart';
import 'package:snap_shot/features/checkout/presentation/manager/checkout/checkout_cubit.dart';
import 'package:snap_shot/features/checkout/presentation/view/widgets/checkout_address_builder.dart';
import 'package:snap_shot/features/checkout/presentation/view/widgets/checkout_place_order_builder_button.dart';
import 'package:snap_shot/features/checkout/presentation/view/widgets/checkout_price_summery.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';
import 'package:snap_shot/shared/widgets/page_header.dart';
import 'package:snap_shot/features/checkout/presentation/view/widgets/checkout_payment_method.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CheckoutCubit>()
        ..getUserData()
        ..getCosts(products),
      child: BlocListener<CheckoutCubit, CheckoutState>(
        listener: (context, state) async {
          if (state is PaymentComplete) {
            await context.read<CheckoutCubit>().makeOrder(prodcuts: products);
            if (!context.mounted) return;
            context.go(Routes.instance.cartView);
          } else if (state is PaymentFailed) {
            AppSnackBar.show(context, message: state.errMessage, isError: true);
          }
        },
        child: Scaffold(
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
                    const CheckoutAddressBuilder(),
                    AppSpace.instance.v12,
                    const Divider(thickness: 2),
                    AppSpace.instance.v4,
                    const CheckoutPaymentMethod(),
                    AppSpace.instance.v12,
                    const Divider(thickness: 2),
                    AppSpace.instance.v12,
                    const CheckoutPriceSummery(),
                    AppSpace.instance.v16,
                    PlaceOrderBuilderButton(products: products),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
