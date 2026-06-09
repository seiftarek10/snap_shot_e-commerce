import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/di/sl.dart';
import 'package:snap_shot/core/shared_managers/get_products_cubit/get_all_products_cubit.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/features/owner_all_products/presentation/view/widgets/all_products_category.dart';
import 'package:snap_shot/shared/widgets/page_header.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';
import 'package:snap_shot/features/owner_all_products/presentation/view/widgets/all_categories_list.dart';

class OwnerAllProductsView extends StatelessWidget {
  const OwnerAllProductsView({super.key, required this.fromHomeScreen});
  final bool fromHomeScreen;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetAllProductsCubit>()..getAllProducts(),
      child: fromHomeScreen
          ? Scaffold(body: SafeArea(child: _buildBody()))
          : _buildBody(),
    );
  }

  _buildBody() {
    return PagePadding(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                AppSpace.instance.topPageSpace,
                AppPageTitle(
                  pageTitle: "All Products",
                  arrowBack: fromHomeScreen,
                ),
                AppSpace.instance.v8,

                const Divider(),
                AppSpace.instance.v8,

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "All Categoires",
                    textAlign: TextAlign.left,
                    style: AppTextStyle.instance.text16W600,
                  ),
                ),
                AppSpace.instance.v8,

                const OwnerAllCategoriesList(),
                AppSpace.instance.v8,
              ],
            ),
          ),
          const OwnerAllProductsCategory(),
        ],
      ),
    );
  }
}
