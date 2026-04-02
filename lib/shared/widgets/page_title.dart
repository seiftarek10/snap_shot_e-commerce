import 'package:flutter/material.dart';
import 'package:snap_shot/core/style/fonts.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({super.key, required this.pageTitle});
  final String pageTitle;
  @override
  Widget build(BuildContext context) {
    return Text(
      pageTitle,
      style: AppTextStyle.instance.text28Bold,
    );
  }
}
