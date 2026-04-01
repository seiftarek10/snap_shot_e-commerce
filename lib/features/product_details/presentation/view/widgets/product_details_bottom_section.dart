import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/widgets/app_button.dart';
import 'package:snap_shot/features/product_details/presentation/view/widgets/bottom_section_item.dart';
import 'package:snap_shot/features/product_details/presentation/view/widgets/product_price.dart';

class ProductDetailsBottomSection extends StatelessWidget {
  const ProductDetailsBottomSection({super.key});

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
              const ProductPrice(),
              AppSpace.instance.v12,
              SizedBox(
                height: 120.h,
                child: Row(
                  children: [
                    const Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProductDetailsBottomSectionItem(
                            title: 'Size',
                            subTitle: "Large",
                          ),
                          ProductDetailsBottomSectionItem(
                            title: 'Size',
                            subTitle: "Large",
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 4,
                            child: ProductDetailsBottomSectionItem(
                              title: '3',
                              subTitle: "",
                              isCounterItem: true,
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Expanded(
                            flex: 4,
                            child: ProductDetailsBottomSectionItem(
                              title: 'Brand',
                              subTitle: "lar",
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppSpace.instance.h16,
                    Expanded(
                      flex: 3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: AppButton(
                              buttonTitle: 'Add To\n  Cart',
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
