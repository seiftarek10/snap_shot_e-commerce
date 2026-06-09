import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class OnBoardingImage extends StatelessWidget {
  const OnBoardingImage({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: const CircularDottedBorderOptions(
        padding: EdgeInsets.all(8),
        color: Colors.grey,
        strokeWidth: 2.3,
        dashPattern: [20, 10],
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(60),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[300],
          ),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
