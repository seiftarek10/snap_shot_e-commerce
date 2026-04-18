

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/assets.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class CategoryProductItem extends StatelessWidget {
  const CategoryProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100.h,
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Image.asset(
                  Assets.imagesPngOnboardingimage3,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Product Name",
                          style: AppTextStyle.instance.text16W600,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Rating",
                              style: AppTextStyle.instance.text12W500,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "(4.3)",
                              style: AppTextStyle.instance.text12W200,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        r"$240",
                        style: AppTextStyle.instance.text18W700,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    children: [
                      Expanded(
                        child: Icon(
                          Icons.edit,
                          size: 20.h,
                          color: AppColors.instance.blueGrey,
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        child: Icon(
                          Icons.delete,
                          size: 20.h,
                          color: const Color.fromARGB(255, 158, 43, 35),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(thickness: 2)
      ],
    );
  }
}
