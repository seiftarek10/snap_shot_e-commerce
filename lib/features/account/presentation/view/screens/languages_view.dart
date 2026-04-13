import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/features/account/presentation/view/widgets/account_pages_header.dart';
import 'package:snap_shot/features/account/presentation/view/widgets/languages/all_languages_list.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';

class LanguagesView extends StatelessWidget {
  const LanguagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PagePadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpace.instance.topPageSpace,
              const AccountPagesHeader(pageTitle: 'Languages'),
              AppSpace.instance.v20,
              Text("Suggested", style: AppTextStyle.instance.text18W700),
              AppSpace.instance.v12,
              const Expanded(child: AllLanguagesList()),
            ],
          ),
        ),
      ),
    );
  }
}
