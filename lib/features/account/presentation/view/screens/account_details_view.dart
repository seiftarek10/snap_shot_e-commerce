import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/features/account/presentation/view/widgets/account_details/edit_form.dart';
import 'package:snap_shot/shared/widgets/page_header.dart';

import 'package:snap_shot/shared/widgets/page_padding.dart';

class AccountDetailsView extends StatelessWidget {
  const AccountDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: PagePadding(
            child: Column(
              children: [
                AppSpace.instance.topPageSpace,
                const PageHeader(pageTitle: 'Account Details', arrowBack: true),
                AppSpace.instance.v20,
                const AccountDetailsEditForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
