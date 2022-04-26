import 'package:flutter/material.dart';

abstract class Constant {
  /////////////+COLORS+////////////
  //WHITE
  static const fonColor = Color.fromARGB(255, 255, 255, 255);
  static const green = Color(0xFF4caf50);
  static const yelow = Color(0xFFFCDD3D);
  static const red = Color(0xfffef4343);
  static const main = Color(0xFF252849);
  static const secondary = Color(0xFF3B3E5B);
  static const incativeBlack = Color.fromRGBO(124, 126, 146, 0.56);
  static const white = Color(0xFFFFFFFF);
  static const textColor = Color(0xFF252849);

  //BLACK
  /////////////-COLORS-////////////

  ////////////+TEXT+///////////

  static const text = "Список\nинтересных мест";
  static const Map<String, Color?> textAndColors = {
    "С": green,
    "писок\n": null,
    "и": yelow,
    "нтересных мест": null,
  };

  static const TextStyle style = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w100,
    height: 1.125,
    color: Constant.textColor,
    fontFamily: 'RobotoBold',
  );
  ////////////-TEXT-///////////
}
