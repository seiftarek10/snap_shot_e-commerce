import 'package:flutter/material.dart';

import 'package:snap_shot/core/constants/space.dart';

import 'package:snap_shot/features/account/presentation/view/widgets/account_pages_header.dart';
import 'package:snap_shot/features/account/presentation/view/widgets/payment_method/credit_card.dart';
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
                const AccountPagesHeader(pageTitle: 'Payment Method'),
                AppSpace.instance.v40,
                const CreditCard(),
                AppSpace.instance.v40,
                const WalletCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
