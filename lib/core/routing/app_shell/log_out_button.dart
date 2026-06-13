import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:snap_shot/core/data_source/local_data_source/Hive/hive_boxes_names.dart';
import 'package:snap_shot/core/models/order_model.dart';
import 'package:snap_shot/core/models/product_model.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/core/routing/app_shell/log_out_dialog.dart';
import 'package:snap_shot/core/routing/routes.dart';
import 'package:snap_shot/core/utils/show_snack_bar.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showAnimatedLogoutDialog(context, () async {
          try {
            await FirebaseAuth.instance.signOut();
            await Hive.box<ProductModel>(
              HiveBoxesNames.instance.productsBox,
            ).clear();
            await Hive.box<ProductModel>(
              HiveBoxesNames.instance.favProductsBox,
            ).clear();
            await Hive.box<ProductModel>(
              HiveBoxesNames.instance.cartProdcutBox,
            ).clear();
            await Hive.box<UserModel>(HiveBoxesNames.instance.userBox).clear();
            await Hive.box<OrderModel>(
              HiveBoxesNames.instance.ordersBox,
            ).clear();

            if (!context.mounted) return;
            context.go(Routes.instance.signIn);
          } catch (e) {
            AppSnackBar.show(context, message: e.toString(), isError: true);
          }
        });
      },
      icon: Icon(Icons.logout_outlined, size: 22.h),
    );
  }
}
