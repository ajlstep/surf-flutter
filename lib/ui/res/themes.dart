import 'package:flutter/material.dart';

import 'package:places/const/colors.dart';
import 'package:places/const/dark_colors.dart';

import 'package:places/const/textstyle.dart';

final lightTheme = ThemeData(
  primaryColor: CDarkColors.white,
  backgroundColor: CDarkColors.white,
  textTheme: TextTheme(
    titleLarge: CTextStyles.largeTitle,
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: CTextStyles.subtitle,
    toolbarTextStyle: CTextStyles.subtitle,
  ),
);
