import 'dart:async';

import 'package:flutter/material.dart';
import 'package:snap_shot/core/style/fonts.dart';

class ResendCounter extends StatefulWidget {
  const ResendCounter({super.key});

  @override
  State<ResendCounter> createState() => _ResendCounterState();
}

class _ResendCounterState extends State<ResendCounter> {
  late int _counter;

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_counter > 0) {
        setState(() {
          _counter--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _counter = 60;
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _counter = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {},
        child: Text(
          'Resend Code in $_counter S',
          style: AppTextStyle.instance.text14WBoldBlack,
        ),
      ),
    );
  }
}
