import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class AllUsersCardItem extends StatelessWidget {
  const AllUsersCardItem({
    super.key,
    required this.userName,
    required this.phoneNumber,
    required this.address,
  });

  final String userName, phoneNumber, address;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      elevation: 3,
      shadowColor: AppColors.instance.grey,
      borderRadius: BorderRadius.circular(8.r),
      clipBehavior: Clip.hardEdge, //
      child: ListTile(
        title: Text(userName, style: AppTextStyle.instance.text16W600),
        subtitle: Text(
          phoneNumber,
          style: AppTextStyle.instance.text12W500Black,
        ),
        trailing: Text(address, style: AppTextStyle.instance.text12W500),
      ),
    );
  }
}