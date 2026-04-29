import 'package:flutter/material.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class PriceRangeSlider extends StatefulWidget {
  const PriceRangeSlider({super.key, required this.values});
  final ValueChanged<RangeValues> values;

  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  RangeValues _currentRange = const RangeValues(10, 3000);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Price",
          style: AppTextStyle.instance.text16W400.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.instance.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${_currentRange.start.toInt()}',
                style: AppTextStyle.instance.text12W500,
              ),
              Text(
                '\$${_currentRange.end.toInt()}',
                style: AppTextStyle.instance.text12W500,
              ),
            ],
          ),
        ),
        // The RangeSlider
        RangeSlider(
          values: _currentRange,
          min: 0,
          max: 3000,
          divisions: 100,
          labels: RangeLabels(
            '\$${_currentRange.start.toInt()}',
            '\$${_currentRange.end.toInt()}',
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRange = values;
              widget.values(values);
            });
          },
          activeColor: Colors.black, // color of the track
          inactiveColor: Colors.grey[300],
        ),
      ],
    );
  }
}
