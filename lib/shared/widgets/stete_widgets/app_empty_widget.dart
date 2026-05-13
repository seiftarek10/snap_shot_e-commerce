import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class AppEmptyWidget extends StatefulWidget {
  const AppEmptyWidget({super.key});

  @override
  State<AppEmptyWidget> createState() => _AppEmptyWidgetState();
}

class _AppEmptyWidgetState extends State<AppEmptyWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true); // Makes it animate back and forth

    _animation = Tween<double>(
      begin: 0.8,
      end: 1.1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ScaleTransition(
            scale: _animation,
            child: Icon(
              Icons.layers_clear_outlined,
              size: 100.h,
              color: Colors.grey.withValues(alpha: 0.5),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Empty', // Fixed text
            style: AppTextStyle.instance.text28Bold.copyWith(
              color: AppColors.instance.grey,
            ),
          ),
        ],
      ),
    );
  }
}
