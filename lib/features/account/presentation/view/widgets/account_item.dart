
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/fonts.dart';
import 'package:snap_shot/features/account/data/models/account_item_model.dart';

class MyAccountItem extends StatelessWidget {
  const MyAccountItem({super.key,required this.accountItemModel});

  final AccountItemModel accountItemModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(accountItemModel.routePath);
      },
      child: SizedBox(
        height: 35.h,
        child: Row(
          children: [
            Expanded(
              child: SvgPicture.asset(
                accountItemModel.icon,
                fit: BoxFit.fill,
              ),
            ),
            AppSpace.instance.h16,
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                     accountItemModel.title ,
                      style: AppTextStyle.instance.text14W500Black,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      accountItemModel.subTitle,
                      style: AppTextStyle.instance.text11W200grey,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios_outlined, size: 15.h),
          ],
        ),
      ),
    );
  }
}
