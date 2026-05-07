import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/features/product_details/presentation/view/widgets/user/user_bottom_sheet_counter_widget.dart';
import 'package:snap_shot/shared/widgets/app_button.dart';
import 'package:snap_shot/features/product_details/presentation/view/widgets/user/user_bottom_section_item.dart';
import 'package:snap_shot/features/product_details/presentation/view/widgets/user/user_product_price_text.dart';

class UserProductDetailsBottomSheet extends StatelessWidget {
  const UserProductDetailsBottomSheet({
    super.key,
    required this.rate,
    required this.stock,
    required this.brand,
    required this.price,
    required this.inCart,
  });
  final String rate, stock, brand, price;
  final bool inCart;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.bottomCenter,
      child: FractionallySizedBox(
        heightFactor: 0.36,
        widthFactor: 1,

        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
          decoration: _buildContainerDecoration(),
          child: Column(
            children: [
              UserProductPriceText(price: price),
              AppSpace.instance.v12,
              SizedBox(
                height: 120.h,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UserProductDetailsBottomSheetItem(
                            title: 'rate',
                            subTitle: rate,
                          ),
                          UserProductDetailsBottomSheetItem(
                            title: 'stock',
                            subTitle: stock,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 4,
                            child: UserBottomSheetCounterWidget(
                              counterListner: (counter) {},
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          Expanded(
                            flex: 4,
                            child: UserProductDetailsBottomSheetItem(
                              title: 'Brand',
                              subTitle: brand,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppSpace.instance.h12,
                    Expanded(
                      flex: 3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: AppButton(
                              isClicked: false,
                              backgroundColor: inCart ? Colors.red[900] : null,
                              buttonTitle:
                                  '${inCart ? 'Remove From\n' : 'Add To\n'}Cart',
                              onPressed: () {},
                            ),
                          ),
                        ],
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
