import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/features/owenr_all_orders/presentation/manager/get_all_app_orders/get_all_app_orders_cubit.dart';

class OrderStatusIndicator extends StatefulWidget {
  const OrderStatusIndicator({super.key, required this.labels});
  final List<String> labels;

  @override
  State<OrderStatusIndicator> createState() => _PhoneOrEmailWidgetState();
}

class _PhoneOrEmailWidgetState extends State<OrderStatusIndicator> {
  late int currentIndex;
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
      decoration: BoxDecoration(
        color: AppColors.instance.black,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          widget.labels.length,
          (index) => Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
                context.read<GetAllAppOrdersCubit>().getOrders(
                  index: currentIndex,
                );
              },

              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn,
                decoration: BoxDecoration(
                  color: index == currentIndex
                      ? AppColors.instance.white
                      : AppColors.instance.black,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.h),
                  child: Text(
                    widget.labels[index],
                    textAlign: TextAlign.center,
                    style: AppTextStyle.instance.text16W600.copyWith(
                      color: index == currentIndex
                          ? AppColors.instance.black
                          : AppColors.instance.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
