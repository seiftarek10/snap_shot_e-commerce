import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/shared/widgets/page_header.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';

class AllUserView extends StatelessWidget {
  const AllUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PagePadding(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    AppSpace.instance.topPageSpace,
                    const AppPageTitle(pageTitle: 'All Users', arrowBack: true),
                    AppSpace.instance.v24,
                  ],
                ),
              ),
              SliverList.builder(
                itemCount: 10,
                itemBuilder: (consext, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: PhysicalModel(
                      color: Colors.white,
                      elevation: 3,
                      shadowColor: AppColors.instance.grey,
                      borderRadius: BorderRadius.circular(8.r),
                      clipBehavior: Clip.hardEdge, //
                      child: ListTile(
                        title: Text(
                          'User Name',
                          style: AppTextStyle.instance.text16W600,
                        ),
                        subtitle: Text(
                          'phone Number',
                          style: AppTextStyle.instance.text12W500Black,
                        ),
                        trailing: Text(
                          'Address',
                          style: AppTextStyle.instance.text12W500,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
