import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/di/sl.dart';
import 'package:snap_shot/features/cart/presentation/manager/cart_cubit/user_cart_manager_cubit.dart';
import 'package:snap_shot/features/favorites/presentation/managers/get_fav_products/get_favorites_products_cubit.dart';
import 'package:snap_shot/core/shared_managers/get_products_cubit/get_all_products_cubit.dart';
import 'package:snap_shot/features/user_home/presentation/view/widgets/user_widgets/bloc_widgets/user_cetegories_list_builder.dart';
import 'package:snap_shot/features/user_home/presentation/view/widgets/user_widgets/bloc_widgets/user_product_list_builder.dart';
import 'package:snap_shot/features/user_home/presentation/view/widgets/user_widgets/search/search_builder.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';
import 'package:snap_shot/shared/widgets/snap_shop_word.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({super.key});

  final bool filterActive = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              sl.get<GetAllProductsCubit>()..getAllProducts(),
        ),
        BlocProvider(create: (context) => sl<FavoritesProductsCubit>()),
        BlocProvider(create: (context) => sl<UserCartManegerCubit>()),
      ],
      child: PagePadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpace.instance.topPageSpace,
            const SnapShotWord(),
            AppSpace.instance.v16,
            const UserHomeSearchBuilder(),
            AppSpace.instance.v16,
            const UserCetegoriesListBuilder(),
            AppSpace.instance.v8,
            const Expanded(child: UserHomeProductListBuilder()),
          ],
        ),
      ),
    );
  }
}
