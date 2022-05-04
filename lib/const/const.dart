import 'package:flutter/material.dart';

class CTexts {
  static const text = "Список\nинтересных мест";
  static const Map<String, Color?> textAndColors = {
    "С": CColors.green,
    "писок\n": null,
    "и": CColors.yelow,
    "нтересных мест": null,
  };
}

class CTextStyles {
  static const TextStyle largeTitle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.125,
    color: CColors.textColor,
    fontFamily: 'RobotoBold',
  );
  static const TextStyle title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.208,
    color: CColors.textColor,
    fontFamily: 'RobotoBold',
  );
  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 1.334,
    color: CColors.textColor,
    fontFamily: 'RobotoBold',
  );
  static const TextStyle text = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 1.25,
    color: CColors.textColor,
    fontFamily: 'RobotoBold',
  );
  static const TextStyle smallBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 1.286,
    color: CColors.textColor,
    fontFamily: 'RobotoBold',
  );
  static const TextStyle small = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.246,
    color: CColors.textColor,
    fontFamily: 'RobotoBold',
  );
  static const TextStyle superSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.334,
    color: CColors.textColor,
    fontFamily: 'RobotoBold',
  );
  static const TextStyle button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 1.285,
    color: CColors.textColor,
    fontFamily: 'RobotoBold',
  );
}

class CColors {
  static const fonColor = Color.fromARGB(255, 255, 255, 255);
  static const green = Color(0xFF4caf50);
  static const yelow = Color(0xFFFCDD3D);
  static const red = Color.fromARGB(255, 240, 69, 69);
  static const main = Color(0xFF252849);
  static const secondary = Color(0xFF3B3E5B);
  static const incativeBlack = Color.fromRGBO(124, 126, 146, 0.56);
  static const white = Color(0xFFFFFFFF);
  static const textColor = Color(0xFF252849);
  static const backGround = Color(0xFFF5F5F5);
  static const smallText = Color(0xFF7C7E92);
  static const subTextColor = Color.fromARGB(255, 103, 103, 109);
  static const timeOpenText = Color(0xFF7C7E92);
  static const divider = Color.fromRGBO(124, 126, 146, 0.56);
  static const buttZaplanirovati = Color.fromRGBO(124, 126, 146, 0.56);
  // static const largeTitleColor = Color(0xFFC4C4C4);
}
