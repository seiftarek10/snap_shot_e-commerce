import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/data_source/local_data_source/Hive/hive_boxes_names.dart';
import 'package:snap_shot/core/routing/routes.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/core/utils/show_snack_bar.dart';
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
            const PageHeader(pageTitle: 'My Account', arrowBack: true),
            AppSpace.instance.v12,
            const AllAccountItems(),
            AppSpace.instance.v16,
            TextButton(
              onPressed: () async {
                try {
                  await Hive.box(HiveBoxesNames.instance.productsBox).clear();
                  await Hive.box(
                    HiveBoxesNames.instance.favProductsBox,
                  ).clear();
                  await Hive.box(
                    HiveBoxesNames.instance.cartProdcutBox,
                  ).clear();
                  await Hive.box(HiveBoxesNames.instance.userBox).clear();
                  await Hive.box(HiveBoxesNames.instance.ordersBox).clear();
                  await FirebaseAuth.instance.signOut();
                  if (!context.mounted) return;
                  context.go(Routes.instance.signIn);
                } catch (e) {
                   AppSnackBar.show(
                    context,
                    message: e.toString(),
                    isError: true,
                  );
                }
              },
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
