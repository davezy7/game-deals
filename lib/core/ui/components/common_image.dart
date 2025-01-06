import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CommonImage extends StatelessWidget {
  const CommonImage({
    super.key,
    required this.imageUrl,
    this.height = 150,
    this.width = 150,
    this.borderRadius,
  });

  final String imageUrl;
  final double height;
  final double width;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      key: Key(imageUrl),
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(6),
          image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
        ),
      ),
      progressIndicatorBuilder: (context, url, progress) => SizedBox(
        height: height,
        width: width,
        child: Center(
          child: CircularProgressIndicator(
            key: Key(url),
            value: progress.progress,
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
