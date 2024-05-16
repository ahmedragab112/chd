import 'package:cached_network_image/cached_network_image.dart';
import 'package:chdtask/core/utils/colors/app_color.dart';
import 'package:flutter/material.dart';

class CustomNetWorkImage extends StatelessWidget {
  const CustomNetWorkImage(
      {super.key,
      required this.imagePath,
      required this.width,
      required this.height});
  final String imagePath;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.fill,
      width: width,
      height: height,
      imageUrl: imagePath,
      placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(
        color: AppColor.primeryColor,
      )),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
