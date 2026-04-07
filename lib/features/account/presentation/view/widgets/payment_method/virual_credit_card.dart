import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:snap_shot/core/style/colors.dart';

class VirtualCreditCard extends StatelessWidget {
  const VirtualCreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CreditCardWidget(
      cardNumber: "0zxxxxxx",
      expiryDate: "expiryDate",
      cardHolderName: "cardHolderName",
      cvvCode: "cvvCode",
      cardBgColor: AppColors.instance.blueGrey,
      labelCardHolder: "Label",
      obscureCardCvv: false,
      showBackView: true,
      onCreditCardWidgetChange: (CreditCardBrand brand) {},
    );
  }
}
