import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/shared_domain_data/all_products/domain/entity/product_entity.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/features/product_details/presentation/view/widgets/user/user_bottom_sheet_counter_widget.dart';
import 'package:snap_shot/features/product_details/presentation/view/widgets/user/user_product_details_cart_button.dart';
import 'package:snap_shot/features/product_details/presentation/view/widgets/user/user_bottom_section_item.dart';
import 'package:snap_shot/features/product_details/presentation/view/widgets/user/user_product_price_text.dart';

class UserProductDetailsBottomSheet extends StatelessWidget {
  UserProductDetailsBottomSheet({
    super.key,
    required this.product,
    required this.fromHomeScreen,
  });

  final ProductEntity product;
  final bool fromHomeScreen;

  final ValueNotifier<int> _counterNotifier = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FractionallySizedBox(
        heightFactor: 0.4,
        widthFactor: 1,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
          decoration: _buildContainerDecoration(),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: UserProductPriceText(price: product.price),
              ),
              AppSpace.instance.v12,

              Expanded(
                flex: 4,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: UserProductDetailsBottomSheetItem(
                                    title: 'rate',
                                    subTitle: product.rate,
                                  ),
                                ),
                                AppSpace.instance.h12,
                                Expanded(
                                  child: UserBottomSheetCounterWidget(
                                    counterListner: (counter) {
                                      _counterNotifier.value = counter;
                                    },
                                    counter: product.counter ?? 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AppSpace.instance.v12,

                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: UserProductDetailsBottomSheetItem(
                                    title: 'Brand',
                                    subTitle: product.brand,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    AppSpace.instance.h12,

                    Expanded(
                      flex: 2,
                      child: ValueListenableBuilder<int>(
                        valueListenable: _counterNotifier,
                        builder: (context, currentCount, child) {
                          return UserProductDetailsCartButton(
                            product: product.copyWith(counter: currentCount),
                            fromHomeScreen: fromHomeScreen,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildContainerDecoration() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: AppColors.instance.lighterGrey,
          offset: const Offset(0, -10),
          blurRadius: 5,
        ),
      ],
      color: AppColors.instance.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.r),
        topRight: Radius.circular(30.r),
      ),
    );
  }
}
