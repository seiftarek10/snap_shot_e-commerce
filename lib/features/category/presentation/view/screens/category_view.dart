import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/widgets/page_padding.dart';
import 'package:snap_shot/core/widgets/page_title.dart';
import 'package:snap_shot/features/category/presentation/view/widgets/all_categories_list.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

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
                const PageTitle(pageTitle: "Categories"),
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
