import 'package:flutter/cupertino.dart';

class BackButtonCustom extends StatelessWidget {
  final void Function() onTap;
  final Size size;
  final Color color;
  final Widget? icon;
  final double? borderRadius;
  final String? text;
  const BackButtonCustom({
    Key? key,
    required this.onTap,
    required this.size,
    required this.color,
    this.icon,
    this.borderRadius,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius == null ? null : BorderRadius.circular(8),
        ),
        child: icon == null
            ? Center(
                child: Text(text ?? ""),
              )
            : Center(
                child: icon,
              ),
      ),
    );
  }
}
