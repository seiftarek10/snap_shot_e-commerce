import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(child: child);
  }
}
