import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/assets.dart';
import 'package:snap_shot/core/style/colors.dart';

class UserShoppingBagIcon extends StatefulWidget {
  const UserShoppingBagIcon({super.key, required this.inCart});
  final bool inCart;

  @override
  State<UserShoppingBagIcon> createState() => _UserShoppingBagIconState();
}

class _UserShoppingBagIconState extends State<UserShoppingBagIcon> {
  late bool inCart;
  @override
  void initState() {
    super.initState();
    inCart = widget.inCart;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          inCart = !inCart;
        });
      },
      child: Align(
        alignment: Alignment.topRight,
        child: inCart
            ? Container(
                padding: EdgeInsets.all(6.r),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.instance.black,
                ),
                child: Image.asset(
                  Assets.imagesPngShoppingBag,
                  fit: BoxFit.fill,
                  height: 16.h,
                  color: AppColors.instance.white,
                ),
              )
            : Padding(
                padding: EdgeInsets.all(6.r),
                child: Image.asset(
                  Assets.imagesPngShoppingBag,
                  fit: BoxFit.fill,
                  height: 16.h,
                ),
              ),
      ),
    );
  }
}
