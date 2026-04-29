import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/features/home/presentation/view/widgets/user_widgets/bloc_widgets/user_cetegories_list_builder.dart';
import 'package:snap_shot/features/home/presentation/view/widgets/user_widgets/bloc_widgets/user_product_list_builder.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';
import 'package:snap_shot/shared/widgets/search_field.dart';
import 'package:snap_shot/shared/widgets/snap_shop_word.dart';

class UserHomeView extends StatefulWidget {
  const UserHomeView({super.key});

  @override
  State<UserHomeView> createState() => _UserHomeViewState();
}

class _UserHomeViewState extends State<UserHomeView> {
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
          const UserCetegoriesListBuilder(),
          AppSpace.instance.v8,
          const Expanded(child: UserHomeProductListBuilder()),
        ],
      ),
    );
  }
}
