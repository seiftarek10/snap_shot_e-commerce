import 'package:flutter/material.dart';

import 'package:snap_shot/core/constants/space.dart';

import 'package:snap_shot/shared/widgets/page_header.dart';
import 'package:snap_shot/features/account/presentation/view/widgets/payment_method/virual_credit_card.dart';
import 'package:snap_shot/features/account/presentation/view/widgets/payment_method/wallet_card.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';

class AccountPaymentMethod extends StatelessWidget {
  const AccountPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: PagePadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpace.instance.topPageSpace,
                const PageHeader(pageTitle: 'Payment Method',arrowBack: true ),
                AppSpace.instance.v12,
                const VirtualCreditCard(),
                AppSpace.instance.v12,
                const WalletCard(),
                AppSpace.instance.v20,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
