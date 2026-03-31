import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/widgets/page_padding.dart';
import 'package:snap_shot/core/widgets/search_field.dart';
import 'package:snap_shot/core/widgets/snap_shop_word.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: PagePadding(
        child: Column(
          children: [
            AppSpace.instance.topPageSpace,
            SnapShotWord(),
            SearchField(),
          ],
        ),
      ),
    );
  }
}
