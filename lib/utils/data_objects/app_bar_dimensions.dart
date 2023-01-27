import 'package:flutter/material.dart';

class AppBarAnimateData {
  late void Function() setState;
  final double minValue;
  final double maxValue;
  final double minValue2;
  final double maxValue2;
  final double width;
  final bool isDesktop;
  double _mutableValue = 0;
  double _obst = 0;
  BuildContext context;

  set mutval(double val) {
    _mutableValue = val;
  }

  set obst(double obst) {
    _obst = obst - (isDesktop ? 20 : 0);
  }

  double get value => getValue();
  double get value2 => getValue2();
  FractionalOffset get position => getPosition();
  String get txt => getTxt();
  bool get ob => !(_mutableValue > 25);
  double get border => !(ob && !isDesktop) ? 0 : 1 * 15;
  bool get isPortrait =>
      MediaQuery.of(context).orientation == Orientation.portrait;
  FractionalOffset get alignement =>
      isPortrait ? FractionalOffset.center : FractionalOffset.centerLeft;
  double get prefixBorder => isPortrait ? 16.0 : 32.0;
  double get width_test => () {
        print("$width");
        return width;
      }();
  double get expandedHeight => isPortrait ? width_test : 56.0;

  AppBarAnimateData({
    required this.setState,
    required this.maxValue,
    required this.minValue,
    required this.width,
    required this.maxValue2,
    required this.minValue2,
    required this.isDesktop,
    required this.context,
  });

  double getValue() {
    if (isPortrait) {
      return maxValue - get1(_mutableValue / width) * (maxValue - minValue);
    } else {
      return 18.0;
    }
  }

  double getValue2() {
    return maxValue2 - get1(_mutableValue / width) * (maxValue2 - minValue2);
  }

  FractionalOffset getPosition() {
    if (_mutableValue > _obst) {
      return FractionalOffset.centerLeft;
    } else {
      return FractionalOffset.centerLeft;
    }
  }

  String getTxt() {
    if ((_mutableValue > _obst) || !isPortrait) {
      return "Список интересных мест";
    } else {
      return "Список\nинтересных мест";
    }
  }

  double get1(double numb) {
    if (numb > 1.0) {
      return 1.0;
    } else {
      return numb;
    }
  }
}
