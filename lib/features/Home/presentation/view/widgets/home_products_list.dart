
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/features/Home/presentation/view/widgets/product_item.dart';

class HomeProductsList extends StatelessWidget {
  const HomeProductsList({
    super.key,
  });

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
        return const ProductItem();
      },
    );
  }
}
