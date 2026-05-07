import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_shot/core/routing/routes.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';
import 'package:snap_shot/features/home/presentation/view/widgets/user_widgets/user_home_product_item.dart';

class UserHomeProductsList extends StatelessWidget {
  const UserHomeProductsList({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12.w,
        crossAxisSpacing: 10.h,
        childAspectRatio: 163 / 217,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.push(
              Routes.instance.productDetails,
              extra: products[index],
            );
          },
          child: UserHomeProductItem(
            key: ValueKey(products[index].id),
            product: products[index],
          ),
        );
      },
    );
  }
}
