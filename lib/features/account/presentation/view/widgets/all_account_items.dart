import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/assets.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/routing/routes.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/features/account/data/models/account_item_model.dart';
import 'package:snap_shot/features/account/presentation/view/widgets/account_item.dart';

class AllAccountItems extends StatelessWidget {
  const AllAccountItems({super.key});
  static final List<AccountItemModel> generalItems = [
    AccountItemModel(
      icon: Assets.imagesSvgAccountDetails,
      routePath: Routes.instance.accountDetails,
      subTitle: 'Edit Your Account Information',
      title: 'Account Details',
    ),
    AccountItemModel(
      icon: Assets.imagesSvgPaymentMethod,
      routePath: '',
      subTitle: 'Add Your Credit or Debit Card',
      title: 'Paymen Method',
    ),
    AccountItemModel(
      icon: Assets.imagesSvgDeliveryAddress,
      routePath: '',
      subTitle: 'Edit Or Add New Address',
      title: 'Delivery Address',
    ),
    AccountItemModel(
      icon: Assets.imagesSvgSecurityPassword,
      routePath: '',
      subTitle: 'Edit Your Password',
      title: 'Security & Password',
    ),
  ];
  static final List<AccountItemModel> settingsItem = [
    AccountItemModel(
      icon: Assets.imagesSvgNotifications,
      routePath: '',
      subTitle: 'Manage Your Notifications',
      title: 'Notification',
    ),
    AccountItemModel(
      icon: Assets.imagesSvgLanguage,
      routePath: '',
      subTitle: 'Change App Language',
      title: 'Languages',
    ),
    AccountItemModel(
      icon: Assets.imagesSvgPrivacyPolicy,
      routePath: '',
      subTitle: 'We respect and secure your data',
      title: 'Privacy & Policy',
    ),
    AccountItemModel(
      icon: Assets.imagesSvgContactUs,
      routePath: '',
      subTitle: 'We’re here to help anytime',
      title: 'Contact Us',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSpace.instance.v12,
        Text('General', style: AppTextStyle.instance.text16W600),
        Column(
          children: List.generate(generalItems.length, (index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: MyAccountItem(accountItemModel: generalItems[index]),
            );
          }),
        ),
        const Divider(),
        AppSpace.instance.v12,
        Text('Settings', style: AppTextStyle.instance.text16W600),
        Column(
          children: List.generate(settingsItem.length, (index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: MyAccountItem(accountItemModel: settingsItem[index]),
            );
          }),
        ),
      ],
    );
  }
}
