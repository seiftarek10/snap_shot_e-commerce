import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/constants/assets.dart';

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({
    super.key,
    required this.isFavorite,
    required this.onTap,
  });
  final bool isFavorite;
  final void Function() onTap;

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
        });
        widget.onTap();
      },
      child: Align(
        alignment: Alignment.topRight,
        child: Image.asset(
          isFavorite == true ? Assets.imagesPngRedHeart : Assets.imagesPngHeart,
          fit: BoxFit.fill,
          height: 22.h,
        ),
      ),
    );
  }
}
