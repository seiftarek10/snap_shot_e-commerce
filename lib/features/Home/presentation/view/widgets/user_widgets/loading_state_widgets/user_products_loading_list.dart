import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/assets.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/shared/widgets/stete_widgets/app_loading_widget.dart';

class UserHomeLoadingWidget extends StatelessWidget {
  const UserHomeLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12.w,
        crossAxisSpacing: 10.h,
        childAspectRatio: 163 / 217,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return AppLoadingWidget(
          child: Column(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.1,
                  child: Image.asset(
                    Assets.imagesPngOnboardingimage1,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ESSENCE MASCARA',
                          style: AppTextStyle.instance.text14W500Black,
                        ),
                        Text(
                          r'$ 99.9',

                          style: AppTextStyle.instance.text16W400.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
