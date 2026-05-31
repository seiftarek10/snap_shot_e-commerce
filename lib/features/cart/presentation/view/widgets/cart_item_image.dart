import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CartItemImage extends StatelessWidget {
  const CartItemImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 2,
      child: CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.fill),
    );
  }
}
