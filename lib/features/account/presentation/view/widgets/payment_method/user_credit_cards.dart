import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/features/account/presentation/view/widgets/payment_method/credit_card_info.dart';

class UserSavedCreditCards extends StatefulWidget {
  const UserSavedCreditCards({super.key});

  @override
  State<UserSavedCreditCards> createState() => _UserSavedCreditCardsState();
}

class _UserSavedCreditCardsState extends State<UserSavedCreditCards> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(2, (index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: CreditCardInfo(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            isSelected: currentIndex == index,
            title: 'Master Card - 7844',
            expireDate: '01/2025',
          ),
        );
      }),
    );
  }
}
