import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/widgets/page_padding.dart';
import 'package:snap_shot/core/widgets/search_field.dart';
import 'package:snap_shot/core/widgets/snap_shop_word.dart';
import 'package:snap_shot/features/Home/presentation/view/widgets/all_categories_list.dart';
import 'package:snap_shot/features/Home/presentation/view/widgets/home_products_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
          const AllCategoriesList(),
          AppSpace.instance.v16,
          const Expanded(
            child: HomeProductsList(),
          ),
        ],
      ),
    );
  }
}
