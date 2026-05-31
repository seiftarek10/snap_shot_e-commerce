import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';

class ProductDetailsInOrder extends StatelessWidget {
  const ProductDetailsInOrder({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.instance.white,
        boxShadow: [
          BoxShadow(color: AppColors.instance.greyLight, blurRadius: 7),
        ],
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: CachedNetworkImage(
              imageUrl: productEntity.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    productEntity.name,
                    style: AppTextStyle.instance.text18W300,
                  ),
                ),
                Expanded(
                  child: Text(
                    productEntity.category,
                    style: AppTextStyle.instance.text16W400,
                  ),
                ),
                Expanded(
                  child: Text(
                    r"$"
                    "${productEntity.price}",
                    style: AppTextStyle.instance.text18W700,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              "${productEntity.counter ?? '1'}",
              style: AppTextStyle.instance.text18W700,
            ),
          ),
        ],
      ),
    );
  }
}
