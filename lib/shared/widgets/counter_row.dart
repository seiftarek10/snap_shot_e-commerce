
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/fonts.dart';


class CounterWithoutDecoration extends StatefulWidget {
  const CounterWithoutDecoration({super.key, required this.counterListner, required this.counter});

  final ValueChanged<int> counterListner;
  final int counter;
  @override

  State<CounterWithoutDecoration> createState() => _CounterWithoutDecorationState();
}

class _CounterWithoutDecorationState extends State<CounterWithoutDecoration> {
  late int counter;
  @override
  void initState() {
    super.initState();
    counter=widget.counter;
  }
  @override
  Widget build(BuildContext context) {
      return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                counter++;
                widget.counterListner(counter);
                setState(() {});
              },
              child: Icon(Icons.add, size: 20.h),
            ),
            Text(counter.toString(), style: AppTextStyle.instance.text20W500),
            InkWell(
              onTap: () {
                if (counter > 1) {
                  counter--;
                  widget.counterListner(counter);
                  setState(() {});
                }
              },
              child: Icon(Icons.remove, size: 20.h),
            ),
          ],
        ),
      );

  }
  }




