import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/features/cart/presentation/manager/get_cart_cubit/get_cart_proudcts_cubit.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';
import 'package:snap_shot/shared/widgets/counter_row.dart';

class CartItemCounter extends StatelessWidget {
  const CartItemCounter({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin:  EdgeInsets.(horizontal: 10.w),
      decoration: BoxDecoration(
        color: AppColors.instance.lighterGrey.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(70.r),
      ),
      child: CounterWithoutDecoration(
        counterListner: (counter) {
          context.read<GetCartProudctsCubit>().updateCounter(
            product.id,
            counter,
          );
        },
        counter: product.counter ?? 1,
      ),
    );
  }
}
