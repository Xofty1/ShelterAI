import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AssetImageItem extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  final Color backgroundColor;
  final BoxFit fit;
  final double borderRadius;

  const AssetImageItem({
    super.key,
    required this.imagePath,
    this.width = 100,
    this.height = 100,
    this.backgroundColor =
        const Color(0xFF8B7355), // Brown background color by default
    this.fit = BoxFit.scaleDown,
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: SvgPicture.asset(
            imagePath,
            width: 100,
            height: 100,
          )),
    );
  }
}
