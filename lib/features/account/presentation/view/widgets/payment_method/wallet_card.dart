import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/features/account/presentation/view/widgets/payment_method/enabled_form.dart';
import 'package:snap_shot/features/account/presentation/view/widgets/payment_method/user_credit_cards.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key});

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
          const UserSavedCreditCards(),
          Divider(
            color: AppColors.instance.white,
            height: 25.h,
            thickness: 1.6,
          ),

          AppSpace.instance.v12,
          const ExpandableForm(),
        ],
      ),
    );
  }
}
