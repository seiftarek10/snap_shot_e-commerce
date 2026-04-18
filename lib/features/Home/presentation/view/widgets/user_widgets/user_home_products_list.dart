import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_shot/core/routing/routes.dart';
import 'package:snap_shot/features/home/presentation/view/widgets/user_widgets/user_home_product_item.dart';

class UserHomeProductsList extends StatelessWidget {
  const UserHomeProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12.w,
        crossAxisSpacing: 10.h,
        childAspectRatio: 163 / 217,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.push(Routes.instance.productDetails);
          },
          child: const UserHomeProductItem(),
        );
      },
    );
  }
}
