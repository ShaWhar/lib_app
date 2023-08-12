import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lib_app/constant/strings.dart';

class EasyCachedNetworkImage extends StatelessWidget {
  const EasyCachedNetworkImage({
    Key? key,
    required this.img,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  final String img;
  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: img,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) =>
          Image.asset(
        kUserImage,
        fit: fit,
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
