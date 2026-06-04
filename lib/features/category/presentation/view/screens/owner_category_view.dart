import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/shared/widgets/page_header.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';
import 'package:snap_shot/features/category/presentation/view/widgets/all_categories_list.dart';

class OwnerCategoryView extends StatelessWidget {
  const OwnerCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return PagePadding(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                AppSpace.instance.topPageSpace,
                const AppPageTitle(pageTitle: "Categories", arrowBack: false),
                AppSpace.instance.v8,
              ],
            ),
          ),
          const AllCategoriesSliverList(),
        ],
      ),
    );
  }
}
