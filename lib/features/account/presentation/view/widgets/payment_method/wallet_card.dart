import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/features/account/presentation/view/widgets/payment_method/add_new_card.dart';
import 'package:snap_shot/features/account/presentation/view/widgets/payment_method/credit_card_info.dart';

class WalletCard extends StatefulWidget {
  const WalletCard({super.key});

  @override
  State<WalletCard> createState() => _WalletCardState();
}

class _WalletCardState extends State<WalletCard> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        gradient: LinearGradient(
          colors: [
            AppColors.instance.blueGrey,
            AppColors.instance.blueGrey,
            AppColors.instance.blueGrey.withValues(alpha: 0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Column(
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
          ),
          Divider(
            color: AppColors.instance.white,
            height: 25.h,
            thickness: 1.6,
          ),
          const AddNewCard(),
        ],
      ),
    );
  }
}
