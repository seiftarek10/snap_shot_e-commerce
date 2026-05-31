import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:snap_shot/core/constants/assets.dart';
import 'package:snap_shot/core/data_source/local_data_source/Hive/hive_boxes_names.dart';
import 'package:snap_shot/core/models/order_model.dart';
import 'package:snap_shot/core/models/product_model.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/core/routing/app_router.dart';
import 'package:snap_shot/core/routing/app_shell/nav_bar_item.dart';
import 'package:snap_shot/core/routing/routes.dart';
import 'package:snap_shot/core/utils/show_snack_bar.dart';

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({
    super.key,
    required this.onTap,
    required this.role,
    required this.index,
  });

  final ValueChanged<int> onTap;
  final Role role;
  final int index;

  List<String> _buildIcons(Role role) {
    switch (role) {
      case Role.user:
        return const [
          Assets.imagesPngHome,
          Assets.imagesPngOrder,
          Assets.imagesPngHeart,
          Assets.imagesPngShoppingBag,
          // Assets.imagesPngUser,
        ];
      case Role.owner:
        return const [
          Assets.imagesPngHome,
          Assets.imagesPngCategory,
          Assets.imagesPngOrder,
        ];
      case Role.staff:
      default:
        return const [
          Assets.imagesPngHome,
          Assets.imagesPngCategory,
          Assets.imagesPngHeart,
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final icons = _buildIcons(role);

    return SizedBox(
      height: 70.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...List.generate(
            icons.length,
            (i) => GestureDetector(
              onTap: () {
                onTap(i);
              },
              child: NavBarItem(icon: icons[i], isActive: index == i),
            ),
          ),

          IconButton(
            onPressed: () async {
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
                await Hive.box<UserModel>(
                  HiveBoxesNames.instance.userBox,
                ).clear();
                await Hive.box<OrderModel>(
                  HiveBoxesNames.instance.ordersBox,
                ).clear();

                if (!context.mounted) return;
                context.go(Routes.instance.signIn);
              } catch (e) {
                log(e.toString());
                AppSnackBar.show(context, message: e.toString(), isError: true);
              }
            },
            icon: Icon(Icons.logout_outlined, size: 22.h),
          ),
        ],
      ),
    );
  }
}
