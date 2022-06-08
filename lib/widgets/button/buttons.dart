import 'package:flutter/material.dart';
import 'package:places/widgets/img/svg_icon.dart';

class ButtonConstructor extends StatelessWidget {
  final Widget? text;
  final Widget? icon;
  final MainAxisAlignment? maAAlignment;
  final Color? backgroundColor;
  final Function() onPressed;
  final double? separatorWidth;
  final Vector4 padding;
  const ButtonConstructor({
    Key? key,
    this.text,
    this.icon,
    this.maAAlignment,
    this.backgroundColor,
    this.separatorWidth,
    this.padding = const Vector4(0, 0, 0, 0, 15),
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //padding ??= Vector4(0, 0, 0, 0);

    return TextButton(
      onPressed: onPressed,
      style: backgroundColor == null
          ? null
          : Theme.of(context).elevatedButtonTheme.style?.copyWith(
              backgroundColor:
                  MaterialStateProperty.all<Color>(backgroundColor!)),
      // style: backgroundColor == null
      //     ? null
      //     : ButtonStyle(
      //         backgroundColor:
      //             MaterialStateProperty.all<Color>(backgroundColor!),
      //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      //           RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(padding.radius),
      //           ),
      //         ),
      //       ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            padding.left, padding.left, padding.left, padding.left),
        child: Center(
          child: Row(
            mainAxisAlignment:
                maAAlignment == null ? MainAxisAlignment.center : maAAlignment!,
            children: getWidgets(),
          ),
        ),
      ),
    );
  }

  List<Widget> getWidgets() {
    List<Widget> _list = [];
    if (icon != null) {
      _list.add(icon!);
    }
    _list.add(SizedBox(width: separatorWidth ?? 0));
    if (text != null) {
      _list.add(text!);
    }
    return _list;
  }
}

class Vector4 {
  final double left;
  final double top;
  final double right;
  final double bottom;
  final double radius;

  const Vector4(this.left, this.top, this.right, this.bottom, this.radius);
}

class SvgButton extends StatelessWidget {
  const SvgButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.bottom,
    this.left,
    this.top,
    this.right,
    this.iconColor,
    this.splashColor,
  }) : super(key: key);
  final String icon;
  final Function() onPressed;
  final Color? splashColor;
  final Color? iconColor;
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.fromLTRB(left ?? 0, top ?? 0, right ?? 0, bottom ?? 0),
      child: ClipOval(
        child: SizedBox(
          width: 30,
          height: 30,
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              splashColor: splashColor,
              onTap: onPressed,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: SvgIcon(
                  assetName: icon,
                  color: iconColor,
                  // width: 20,
                  // height: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
