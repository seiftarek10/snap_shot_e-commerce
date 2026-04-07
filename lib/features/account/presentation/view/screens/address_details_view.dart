import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';

import 'package:snap_shot/features/account/presentation/view/widgets/account_pages_header.dart';
import 'package:snap_shot/features/account/presentation/view/widgets/address_details/all_user_addresses.dart';

import 'package:snap_shot/shared/widgets/page_padding.dart';

class AddressDetailsView extends StatelessWidget {
  const AddressDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: PagePadding(
            child: Column(
              children: [
                AppSpace.instance.topPageSpace,
                const AccountPagesHeader(pageTitle: 'Address Details'),
                AppSpace.instance.v16,
                const AllUserAddresses(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
