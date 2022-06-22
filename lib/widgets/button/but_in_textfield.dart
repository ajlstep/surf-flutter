import 'package:flutter/material.dart';
import 'package:places/const/icons.dart';
import 'package:places/widgets/img/svg_icon.dart';

class ClearButtonForController extends StatelessWidget {
  const ClearButtonForController({Key? key, required this.onClear})
      : super(key: key);

  final Function() onClear;

  @override
  Widget build(BuildContext context) {
    // return Expanded(
    //   child: InkWell(
    //     onTap: onClear,
    //     child: const ClipOval(
    //       child: SizedBox(
    //         height: 25,
    //         width: 25,
    //         child: DecoratedBox(
    //           decoration: BoxDecoration(color: Colors.black),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    // return SvgButtonCustom(
    //   onPressed: onClear,
    //   icon: AppIcons.iconClear,
    //   iconColor: Colors.black,
    //   iconPadding: 0,
    // );
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: ClipOval(
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              splashColor: Colors.red,
              onTap: onClear,
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: SvgIcon(
                  assetName: AppIcons.iconClear,
                  color: Colors.black,
                  width: 20,
                  height: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
