import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/features/home/presentation/view%20model/get_products_cubit/get_all_products_cubit.dart';
import 'package:snap_shot/features/home/presentation/view/widgets/user_widgets/loading_state_widgets/user_products_loading_list.dart';
import 'package:snap_shot/features/home/presentation/view/widgets/user_widgets/user_products_list.dart';
import 'package:snap_shot/shared/widgets/stete_widgets/app_error_widget.dart';

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
          return AppErrorWidget(
            errMessage: state.errMessage,
            onTap: () async {
              context.read<GetAllProductsCubit>().getAllProducts();
            },
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
