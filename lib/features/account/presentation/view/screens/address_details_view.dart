import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';

import 'package:snap_shot/shared/widgets/page_header.dart';
import 'package:snap_shot/features/account/presentation/view/widgets/address_details/add_address_form.dart';
import 'package:snap_shot/features/account/presentation/view/widgets/address_details/all_user_addresses.dart';
import 'package:snap_shot/shared/widgets/app_button.dart';

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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppSpace.instance.topPageSpace,
                const PageHeader(pageTitle: 'Address Details',arrowBack: true ),
                AppSpace.instance.v16,
                const AllUserAddresses(),
                AppSpace.instance.v40,
                AppButton(
                  buttonTitle: "Add New Address",
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const AddAddressForm();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
