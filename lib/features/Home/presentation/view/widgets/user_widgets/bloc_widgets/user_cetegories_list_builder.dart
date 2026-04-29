import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/features/home/presentation/view%20model/cubit/get_all_products_cubit.dart';
import 'package:snap_shot/features/home/presentation/view/widgets/user_widgets/loading_state_widgets/user_categories_loading.dart';
import 'package:snap_shot/features/home/presentation/view/widgets/user_widgets/user_home_all_categories_list.dart';

class UserCetegoriesListBuilder extends StatelessWidget {
  const UserCetegoriesListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
      builder: (BuildContext context, GetAllProductsState state) {
        if (state is GetProductsSuccess) {
          return UserHomeAllCategoriesList(
            categories: context.read<GetAllProductsCubit>().categories,
          );
        } else if (state is GetProductsFailure) {
          return SizedBox(
            height: 35.h,
            child: Center(child: Icon(Icons.error, size: 30.h)),
          );
        } else if (state is Loading) {
          return const UserCategoriesLoadingWidget();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
