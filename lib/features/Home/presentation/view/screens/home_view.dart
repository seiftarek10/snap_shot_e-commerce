import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';

import 'package:snap_shot/features/Home/presentation/view/widgets/home_all_categories_list.dart';
import 'package:snap_shot/features/Home/presentation/view/widgets/home_products_list.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';
import 'package:snap_shot/shared/widgets/search_field.dart';
import 'package:snap_shot/shared/widgets/snap_shop_word.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool filterActive = false;
  @override
  Widget build(BuildContext context) {
    return PagePadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSpace.instance.topPageSpace,
          const SnapShotWord(),
          AppSpace.instance.v16,
          const SearchField(),
          AppSpace.instance.v16,
          const HomeAllCategoriesList(),
          AppSpace.instance.v16,
          const Expanded(child: HomeProductsList()),
        ],
      ),
    );
  }
}
