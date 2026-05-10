import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserProductDetailsImage extends StatelessWidget {
  const UserProductDetailsImage({super.key, required this.imageUrl});

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.topCenter,
      child: FractionallySizedBox(
        heightFactor: 0.65,
        widthFactor: 1,
        child: CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.fitWidth),
      ),
    );
  }
}
