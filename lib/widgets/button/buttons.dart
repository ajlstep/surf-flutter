import 'package:flutter/material.dart';
import 'package:places/utils/sizes/vector4.dart';
import 'package:places/widgets/img/svg_icon.dart';

class ButtonConstructor extends StatelessWidget {
  final Widget? text;
  final Widget? icon;
  final MainAxisAlignment? maAAlignment;
  final Color? backgroundColor;
  final Function()? onPressed;
  final double? separatorWidth;
  final Vector4 padding;
  final double? shappe;
  const ButtonConstructor({
    Key? key,
    this.text,
    this.icon,
    this.maAAlignment,
    this.backgroundColor,
    this.separatorWidth,
    this.padding = const Vector4(0, 0, 0, 0, 15),
    this.shappe,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //padding ??= Vector4(0, 0, 0, 0);

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 48),
      child: TextButton(
        onPressed: onPressed,
        style: backgroundColor == null
            ? null
            : Theme.of(context).elevatedButtonTheme.style?.copyWith(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(backgroundColor!),
                  shape: shappe == null
                      ? null
                      : MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(shappe!))),
                ),
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
              padding.left, padding.top, padding.right, padding.bottom),
          child: Center(
            child: Row(
              mainAxisAlignment: maAAlignment == null
                  ? MainAxisAlignment.center
                  : maAAlignment!,
              children: getWidgets(),
            ),
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

class SvgButton extends StatelessWidget {
  const SvgButton({
    Key? key,
    required this.icon,
    this.onPressed,
    this.bottom,
    this.left,
    this.top,
    this.right,
    this.iconColor,
    this.splashColor,
    this.width,
    this.height,
  }) : super(key: key);
  final String icon;
  final void Function()? onPressed;
  final Color? splashColor;
  final Color? iconColor;
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  final double? width;
  final double? height;

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
                  width: width,
                  height: height,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SvgButtonCustom extends StatelessWidget {
  const SvgButtonCustom({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.bottom,
    this.left,
    this.top,
    this.right,
    this.iconColor,
    this.splashColor,
    this.iconPadding,
  }) : super(key: key);
  final String icon;
  final Function() onPressed;
  final Color? splashColor;
  final Color? iconColor;
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  final double? iconPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.fromLTRB(left ?? 0, top ?? 0, right ?? 0, bottom ?? 0),
      child: ClipOval(
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            splashColor: splashColor,
            onTap: onPressed,
            child: Padding(
              padding: EdgeInsets.all(iconPadding ?? 0),
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
    );
  }
}

class SvgButtonCustom2 extends StatelessWidget {
  const SvgButtonCustom2({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.exteriorPadding,
    this.interiorPadding,
    this.iconColor,
    this.splashColor,
    this.iconPadding,
  }) : super(key: key);
  final String icon;
  final Function() onPressed;
  final Color? splashColor;
  final Color? iconColor;
  final Vector4? exteriorPadding;
  final Vector4? interiorPadding;
  final double? iconPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          exteriorPadding?.left ?? 0,
          exteriorPadding?.top ?? 0,
          exteriorPadding?.right ?? 0,
          exteriorPadding?.bottom ?? 0),
      child: ClipOval(
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            splashColor: splashColor,
            onTap: onPressed,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  interiorPadding?.left ?? 0,
                  interiorPadding?.top ?? 0,
                  interiorPadding?.right ?? 0,
                  interiorPadding?.bottom ?? 0),
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
    );
  }
}

// class ActionButton extends ButtonConstructor {
//   ActionButton({required Function() onPressed}) : super(onPressed: onPressed);
  
// }