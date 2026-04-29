
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/features/home/presentation/view%20model/cubit/get_all_products_cubit.dart';
import 'package:snap_shot/features/home/presentation/view/widgets/user_widgets/loading_state_widgets/user_products_loading_list.dart';
import 'package:snap_shot/features/home/presentation/view/widgets/user_widgets/user_products_list.dart';

class UserHomeProductListBuilder extends StatelessWidget {
  const UserHomeProductListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
      builder: (context, state) {
        if (state is Loading) {
          return const UserHomeLoadingWidget();
        } else if (state is GetProductsSuccess) {
          if (state.products.isEmpty) {
            return Center(
              child: Text('Empty', style: AppTextStyle.instance.text50W700),
            );
          }
       

          return UserHomeProductsList(products: state.products);
        } else if (state is GetProductsFailure) {
          return Center(
            child: Text(
              state.errMessage,
              style: AppTextStyle.instance.text50W700,
            ),
          );
        } else {
          return Center(
            child: Text(
              "EEEEEEERRRRRRRRRROOOOOOOORRRRRRRRRRRR",
              style: AppTextStyle.instance.text50W700,
            ),
          );
        }
      },
    );
  }
}
