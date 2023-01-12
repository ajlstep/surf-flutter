import 'package:flutter/material.dart';

class AppPadding {
  static const EdgeInsets padding0horizontal =
      EdgeInsets.only(left: 0, right: 0);
  static const EdgeInsets padding0All = EdgeInsets.all(0);

  static const EdgeInsets bodyNormalAll = EdgeInsets.fromLTRB(16, 24, 16, 8);
  static const EdgeInsets bodyNormalHorizontal =
      EdgeInsets.symmetric(horizontal: 16);

  // static const contentNormalAll =
  //     EdgeInsets.symmetric(horizontal: 16, vertical: 10);
  static const contentNormalAll = EdgeInsets.fromLTRB(1, 1, 1, 1);
  static const bottomSplash =
      EdgeInsets.only(right: 16.0, left: 16.0, bottom: 8.0);
  static const searchWidgetIcon = EdgeInsets.all(10.0);
  static const inputWidgetsInternPadding = EdgeInsets.fromLTRB(16, 0, 16, 0);
  static const addSightExtern = EdgeInsets.all(8.0);
}
