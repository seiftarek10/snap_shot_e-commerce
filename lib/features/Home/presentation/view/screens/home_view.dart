import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/widgets/page_padding.dart';
import 'package:snap_shot/core/widgets/search_field.dart';
import 'package:snap_shot/core/widgets/snap_shop_word.dart';
import 'package:snap_shot/features/Home/presentation/view/widgets/all_categories_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: PagePadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpace.instance.topPageSpace,
            SnapShotWord(),
            AppSpace.instance.v16,
            SearchField(),
            AppSpace.instance.v16,
            AllCategoriesList(),
          ],
        ),
      ),
    );
  }
}
