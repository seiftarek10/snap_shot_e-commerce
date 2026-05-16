import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class NotificationsSwitcher extends StatefulWidget {
  const NotificationsSwitcher({
    super.key,
    required this.isOn,
    required this.label,
  });

  final bool isOn;
  final String label;

  @override
  State<NotificationsSwitcher> createState() => _NotificationsSwitcherState();
}

class _NotificationsSwitcherState extends State<NotificationsSwitcher> {
  late bool isOn;

  @override
  void initState() {
    super.initState();
    isOn = widget.isOn;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.label, style: AppTextStyle.instance.text20Bold),

        Transform.scale(
          scale: 0.7.h,
          child: Switch(
            value: isOn,
            onChanged: (on) {
              setState(() {
                isOn = on;
              });
            },
            activeTrackColor: AppColors.instance.black,
            inactiveTrackColor: AppColors.instance.lighterGrey,
            thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
              if (isOn) {
                return AppColors.instance.white; // ON color
              }
              return AppColors.instance.darkGrey; // OFF color
            }),
          ),
        ),
      ],
    );
  }
}
