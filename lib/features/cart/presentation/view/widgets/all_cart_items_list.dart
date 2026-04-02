
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/features/cart/presentation/view/widgets/cart_item.dart';

class AllCartItemSliverList extends StatelessWidget {
  const AllCartItemSliverList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 2.w),
          child: const CartItem(),
        );
      },
    );
  }
}