import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cached_image_network/custom_cached_image_network.dart';
import '../../theme/app_palette.dart';

/// Network image with a placeholder for products that have no image yet
class CustomProductImage extends StatelessWidget {
  const CustomProductImage({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.iconSize,
    this.fit,
  });
  final String? image;
  final double? height;
  final double? width;
  final double? iconSize;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    if (image?.isEmpty ?? true) {
      return Container(
        height: height,
        width: width,
        color: context.colors.primarySoft,
        child: Icon(Icons.image_outlined, size: iconSize ?? 40.sp, color: context.colors.primary),
      );
    }
    return CustomCachedImageNetwork(
      image: image!,
      height: height,
      width: width,
      fit: fit ?? BoxFit.contain,
    );
  }
}
