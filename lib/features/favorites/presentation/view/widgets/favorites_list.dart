import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_shot/core/routing/routes.dart';
import 'package:snap_shot/core/utils/show_snack_bar.dart';
import 'package:snap_shot/features/favorites/presentation/managers/get_fav_products/get_favorites_products_cubit.dart';
import 'package:snap_shot/features/favorites/presentation/view/widgets/favorite_item.dart';
import 'package:snap_shot/features/favorites/presentation/view/widgets/favorites_loading.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';
import 'package:snap_shot/features/product_details/presentation/model/product_details_extra_model.dart';
import 'package:snap_shot/shared/widgets/stete_widgets/app_empty_widget.dart';
import 'package:snap_shot/shared/widgets/stete_widgets/app_error_widget.dart';

class FavProudctsList extends StatelessWidget {
  const FavProudctsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesProductsCubit, GetFavoritesProductsState>(
      listener: (context, state) async {
        if (state is AddedToFavProducts || state is RemovedFromFavProducts) {
          await context.read<FavoritesProductsCubit>().getFavProudcts();
        } else if (state is FailedAddToFav) {
          AppSnackBar.show(context, message: state.errMessage);
        } else if (state is FailedRemoveFromFav) {
          AppSnackBar.show(context, message: state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is LoaddedFavProucts) {
          if (state.products.isEmpty) {
            return _buildEmptyList();
          }
          return _buildSuccessList(state.products);
        } else if (state is GetFavProuctsFailure) {
          return _buildFailureWidget(context, state.errMessage);
        } else {
          return _buildLoadingList();
        }
      },
    );
  }

  SliverGrid _buildSuccessList(List<ProductEntity> products) {
    return SliverGrid.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 1 / 1.6,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.push(
              Routes.instance.productDetails,
              extra: ProductDetailsExtraModel(
                productEntity: products[index],
                fromHomeScreen: false,
              ),
            );
          },
          child: FavoriteItem(product: products[index]),
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

  SliverFillRemaining _buildFailureWidget(
    BuildContext context,
    String errMessage,
  ) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: AppErrorWidget(
        errMessage: errMessage,
        onTap: () async {
          await context.read<FavoritesProductsCubit>().getFavProudcts();
        },
      ),
    );
  }

  SliverToBoxAdapter _buildLoadingList() {
    return const SliverToBoxAdapter(child: FavoritesLoading());
  }
}
