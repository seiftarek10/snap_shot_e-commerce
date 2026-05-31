import 'package:flutter/material.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class PriceRangeSlider extends StatefulWidget {
  const PriceRangeSlider({
    super.key,
    required this.values,
    required this.maxValue,
    required this.minValue,
  });

  final ValueChanged<RangeValues> values;
  final double maxValue, minValue;

  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  late RangeValues _currentRange;

  @override
  void initState() {
    super.initState();
    _currentRange = RangeValues(widget.minValue, widget.maxValue);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.minValue >= widget.maxValue) {
      return const Center(child: Text("Invalid Price Range"));
    }

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
        RangeSlider(
          values: _currentRange,
          min: widget.minValue,
          max: widget.maxValue,
          divisions: 100,
          labels: RangeLabels(
            '\$${_currentRange.start.toInt()}',
            '\$${_currentRange.end.toInt()}',
          ),
          onChanged: (RangeValues newValues) {
            setState(() {
              _currentRange = newValues;
              widget.values(newValues);
            });
          },
          activeColor: Colors.black,
          inactiveColor: Colors.grey[300],
        ),
      ],
    );
  }
}
