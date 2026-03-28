import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/core/widgets/arrow_back.dart';
import 'package:snap_shot/core/widgets/page_padding.dart';
import 'package:snap_shot/features/Authentication/presentation/view/widgets/auth_page_title.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PagePadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpace.instance.topPageSpace,
              ArrowBackWidget(),
              AppSpace.instance.v20,
              AuthPageTitle(title: "Forget Password"),
              AppSpace.instance.v16,
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.instance.grey, width: 3),
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                      ],
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
}
