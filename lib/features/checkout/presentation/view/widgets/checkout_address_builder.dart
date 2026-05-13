import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/features/checkout/presentation/manager/checkout/checkout_cubit.dart';
import 'package:snap_shot/features/checkout/presentation/view/widgets/checkout_address.dart';
import 'package:snap_shot/features/checkout/presentation/view/widgets/checkout_address_loading.dart';
import 'package:snap_shot/shared/widgets/stete_widgets/app_error_widget.dart';

class CheckoutAddressBuilder extends StatelessWidget {
  const CheckoutAddressBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      buildWhen: (previous, current) {
    return current is GetUserDataSuccess || 
           current is FailedToGetUserData || 
           current is GettingUserData;
  },
      builder: (context, state) {
        if (state is GetUserDataSuccess) {
          return CheckoutAddressWidget(address: state.user.address);
        } else if (state is FailedToGetUserData) {
          return AppErrorWidget(
            errMessage: state.errMessage,
            onTap: () async {
              await context.read<CheckoutCubit>().getUserData();
            },
          );
        } else {
          return const CheckoutAddressLoading();
        }
      },
    );
  }
}
