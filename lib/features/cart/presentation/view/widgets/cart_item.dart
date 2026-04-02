
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/features/cart/presentation/view/widgets/cart_item_data.dart';
import 'package:snap_shot/features/cart/presentation/view/widgets/cart_item_delete.dart';
import 'package:snap_shot/features/cart/presentation/view/widgets/cart_item_image.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.instance.white,
        boxShadow: [
          BoxShadow(color: AppColors.instance.greyLight, blurRadius: 7),
        ],
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        children: [
          const Expanded(
            flex: 4,
            child: CartItemImage(),
          ),
          AppSpace.instance.h12,
          const Expanded(
            flex: 3,
            child: CartItemData(),
          ),
    
          const Expanded(
            flex: 3,
            child: CartItemDeleteIcon(),
          ),
        ],
      ),
    );
  }
}



