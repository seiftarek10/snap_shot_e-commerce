import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/shared/widgets/page_header.dart';

import 'package:snap_shot/features/account/presentation/view/widgets/all_account_items.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';

class MyAccountView extends StatelessWidget {
  const MyAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return PagePadding(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppSpace.instance.topPageSpace,
            const PageHeader( pageTitle: 'My Account',arrowBack: true ),
            AppSpace.instance.v12,
            const AllAccountItems(),
            AppSpace.instance.v16,
            TextButton(
              onPressed: () {},
              child: Text(
                "Log Out",
                style: AppTextStyle.instance.text18W700.copyWith(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
