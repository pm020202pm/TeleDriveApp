import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor = Colors.black,
    required this.fit,
    this.padding,
    this.isNetworkImg = false,
    this.onPressed,
    this.borderRadius = 20,
  });

  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImg;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            border: border,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
            fit: fit,
            image: isNetworkImg
                ? NetworkImage(imageUrl)
                : AssetImage(imageUrl) as ImageProvider,
          ),
        ),
      ),
    );
  }
}
