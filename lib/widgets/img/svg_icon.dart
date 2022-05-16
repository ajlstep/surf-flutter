import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final Color? color;

  const SvgIcon(
      {Key? key, required this.assetName, this.color, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      height: height,
      width: width,
      color: color,
    );
  }
}
