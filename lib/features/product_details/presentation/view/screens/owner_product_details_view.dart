import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/features/product_details/presentation/view/widgets/owner/owner_product_details_edit_form.dart';
import 'package:snap_shot/features/product_details/presentation/view/widgets/owner/owner_product_image.dart';
import 'package:snap_shot/shared/widgets/page_header.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';

class OwnerProductDetailsView extends StatelessWidget {
  const OwnerProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: PagePadding(
            child: Column(
              children: [
                AppSpace.instance.topPageSpace,
                const PageHeader(pageTitle: 'Product Name', arrowBack: true),
                AppSpace.instance.v12,
                const OwnerProductDetailsImage(),
                AppSpace.instance.v12,
                const OwnerProductDetailsEditForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
