import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/features/home/presentation/manager/get_products_cubit/get_all_products_cubit.dart';
import 'package:snap_shot/features/home/presentation/view/widgets/user_widgets/search/search_field.dart';

class UserHomeSearchBuilder extends StatelessWidget {
  const UserHomeSearchBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    GetAllProductsCubit productsCubit = context.read<GetAllProductsCubit>();
    List<String>? allRates;
    RangeValues? currentRange ;
    return BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
      builder: (context, state) {
        if (state is GetProductsSuccess) {
          RangeValues range = productsCubit.getPricesRange();
          return SearchField(
            maxValue: range.end,
            minValue: range.start,
            onApplyPressed: () {
              productsCubit.filter(currentRange??productsCubit.getPricesRange(), allRates??[]);
            },
            onChanged: (searchKey) {
              context.read<GetAllProductsCubit>().searchByName(
                searchKey: searchKey,
              );
            },
            prices: (rangePrice) {
              currentRange = RangeValues(rangePrice.start, rangePrice.end);
            },
            rating: (rates) {
              allRates = rates;
            },
          );
        } else if (state is GetProductsFailure) {
          return SearchField(
            maxValue: 1.0,
            minValue: 0,
            onApplyPressed: () {},
            onChanged: (searchKey) {},
            prices: (rangePrice) {},
            rating: (rates) {},
          );
        } else {
          return Skeletonizer(
            enabled: true,
            child: SizedBox(
              height: 50.h,
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Bone(
                      width: double.infinity,
                      height: 50.h,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  AppSpace.instance.h12,

                  Bone(
                    width: 50.h,
                    height: 50.h,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
