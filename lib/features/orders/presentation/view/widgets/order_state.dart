import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snap_shot/core/constants/assets.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/core/style/fonts.dart';

enum CurrentOrderState {
  confirmed(
    label: 'Confirmed',
    backgroundColor: Color.fromARGB(180, 202, 248, 202),
    textColor: Color.fromARGB(255, 41, 207, 44),
  ),
  preparing(
    label: 'Preparing',
    backgroundColor: Color.fromARGB(255, 253, 249, 213),
    textColor: Color.fromARGB(255, 255, 173, 41),
  ),
  shipped(
    label: 'Shipped',
    backgroundColor: Color.fromARGB(255, 216, 237, 255),
    textColor: Color.fromARGB(255, 27, 141, 235),
  );

  const CurrentOrderState({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
  });

  final String label;
  final Color backgroundColor;
  final Color textColor;
}

class OrderState extends StatelessWidget {
  const OrderState({super.key, required this.currentState});
  final CurrentOrderState currentState;

  

  @override
  Widget build(BuildContext context) {
     const stateIcons = {
    CurrentOrderState.confirmed: [Assets.imagesSvgConfirmed],
    CurrentOrderState.preparing: [
      Assets.imagesSvgConfirmed,
      Assets.imagesSvgPreparing,
    ],
    CurrentOrderState.shipped: [
      Assets.imagesSvgConfirmed,
      Assets.imagesSvgPreparing,
      Assets.imagesSvgShipped,
    ],
  };
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: _StatusBadge(state: currentState)),
        AppSpace.instance.h16,
        Expanded(
          flex: 2,
          child: _StateIcons(icons: stateIcons[currentState]!),
        ),
      ],
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.state});
  final CurrentOrderState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: state.backgroundColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        state.label,
        textAlign: TextAlign.center,
        style: AppTextStyle.instance.text12W500.copyWith(
          color: state.textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _StateIcons extends StatelessWidget {
  const _StateIcons({required this.icons});
  final List<String> icons;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: icons
          .map((icon) => Expanded(child: SvgPicture.asset(icon, height: 25.h)))
          .toList(),
    );
  }
}
