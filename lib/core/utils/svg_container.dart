import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgContainer extends StatelessWidget {
  const SvgContainer(
      {super.key,
      required this.assetName,
      required this.height,
      required this.width,
      required this.color,
      required this.padding,
      this.radius});

  final String assetName;
  final double height;
  final double width;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: radius,
        color: color,
      ),
      child: SvgPicture.asset(
        assetName,
      ),
    );
  }
}
