import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/shared_domain_data/all_products/domain/entity/product_entity.dart';
import 'package:snap_shot/core/style/fonts.dart';

class OwnerCategoryProductItem extends StatelessWidget {
  const OwnerCategoryProductItem({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100.h,
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: CachedNetworkImage(imageUrl: product.imageUrl),
              ),
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          product.name,
                          style: AppTextStyle.instance.text16W600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Rating",
                              style: AppTextStyle.instance.text12W500,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "(${product.rate})",
                              style: AppTextStyle.instance.text12W200,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        r"$"
                        "${product.price}",
                        style: AppTextStyle.instance.text18W700,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.arrow_forward_ios_rounded, size: 20.h),
                ),
              ),
            ],
          ),
        ),
        const Divider(thickness: 2),
      ],
    );
  }
}
