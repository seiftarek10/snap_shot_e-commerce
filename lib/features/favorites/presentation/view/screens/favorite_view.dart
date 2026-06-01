import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/di/sl.dart';
import 'package:snap_shot/features/favorites/presentation/managers/get_fav_products/get_favorites_products_cubit.dart';
import 'package:snap_shot/features/favorites/presentation/view/widgets/favorites_list.dart';
import 'package:snap_shot/shared/widgets/page_header.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<FavoritesProductsCubit>()..getFavProudcts(loadingState: true),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            sliver: const SliverToBoxAdapter(
              child: PageHeader(pageTitle: 'Favorite List', arrowBack: false),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            sliver: const FavProudctsList(),
          ),
        ],
      ),
    );
  }
}
