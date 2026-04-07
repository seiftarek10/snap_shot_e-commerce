
import 'package:flutter/material.dart';
import 'package:snap_shot/shared/widgets/arrow_back.dart';
import 'package:snap_shot/shared/widgets/page_title.dart';

class AccountPagesHeader extends StatelessWidget {
  const AccountPagesHeader({super.key, required this.pageTitle});
  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ArrowBackWidget(),
        Expanded(
          child: Center(child: PageTitle(pageTitle: pageTitle)),
        ),
      ],
    );
  }
}