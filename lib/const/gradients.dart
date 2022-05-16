import 'package:flutter/material.dart';

class CGradients {
  static const Gradient whiteImageGradient = LinearGradient(
    colors: [
      Color.fromRGBO(37, 40, 73, 1),
      Color.fromRGBO(59, 62, 91, 0.08),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  CGradients._();
}
