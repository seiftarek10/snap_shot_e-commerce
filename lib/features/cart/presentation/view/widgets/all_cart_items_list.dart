import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/utils/show_snack_bar.dart';
import 'package:snap_shot/features/cart/presentation/manager/get_cart_cubit/get_cart_proudcts_cubit.dart';
import 'package:snap_shot/features/cart/presentation/view/widgets/cart_item.dart';
import 'package:snap_shot/features/cart/presentation/view/widgets/cart_loading_list.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';
import 'package:snap_shot/features/home/presentation/manager/cart_cubit/user_cart_manager_cubit.dart';
import 'package:snap_shot/shared/widgets/stete_widgets/app_empty_widget.dart';
import 'package:snap_shot/shared/widgets/stete_widgets/app_error_widget.dart';

class AllCartItemSliverList extends StatelessWidget {
  const AllCartItemSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCartManegerCubit, UserCartManagerState>(
      listener: (context, state) async {
        if (state is RemoveFromCartSuccess) {
          await context.read<GetCartProudctsCubit>().getCartProudcts();
          if (!context.mounted) return;
          AppSnackBar.show(context, message: 'Deleted');
        }
        if (state is RemoveFromCartFailure) {
          AppSnackBar.show(context, message: state.errMessage);
        }
      },
      child: BlocBuilder<GetCartProudctsCubit, GetCartProudctsState>(
        builder: (context, state) {
          if (state is CartProudctsLoadded) {
            if (state.products.isEmpty) {
              return _buildEmptyList();
            }
            return _buildSuccessList(state.products);
          } else if (state is FailedLoadCartProducts) {
            return _buildErrorWidget(context, state.errMessage);
          } else {
            return _buildLoadingList();
          }
        },
      ),
    );
  }

  SliverList _buildSuccessList(List<ProductEntity> products) {
    return SliverList.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 2.w),
          child: CartItem(product: products[index]),
        );
      },
    );
  }

  SliverFillRemaining _buildEmptyList() {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Center(child: AppEmptyWidget()),
    );
  }

  SliverToBoxAdapter _buildLoadingList() {
    return const SliverToBoxAdapter(child: CartLoadingList());
  }

  SliverToBoxAdapter _buildErrorWidget(
    BuildContext context,
    String errMessage,
  ) {
    return SliverToBoxAdapter(
      child: AppErrorWidget(
        errMessage: errMessage,
        onTap: () async {
          await context.read<GetCartProudctsCubit>().getCartProudcts();
        },
      ),
    );
  }
}
