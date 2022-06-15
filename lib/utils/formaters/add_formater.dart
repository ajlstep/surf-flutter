import 'package:flutter/services.dart';

class SightLocationFormater extends TextInputFormatter {
  // bool ifInputDot = false;
  final bool ifLong;
  static const double _minLat = -90;
  static const double _maxLat = 90;
  static const double _minLon = -180;
  static const double _maxLon = 180;
  String valText = "";
  String oldText = "";
  SightLocationFormater({required this.ifLong});
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    oldText = oldValue.text;
    valText = newValue.text;
    checkSym();
    checkPoints();
    if (ifLong) {
      normLon();
    } else {
      normLat();
    }
    return TextEditingValue(
      text: valText,
      selection:
          TextSelection.fromPosition(TextPosition(offset: valText.length)),
    );
  }

  void checkSym() {
    valText = valText.replaceAll(" ", "");
  }

  void checkPoints() {
    var r = RegExp("\\.");
    while (r.allMatches(valText).length > 1) {
      var lastIndex = valText.lastIndexOf(".");
      if (lastIndex == -1) {
        return;
      }
      valText =
          valText.substring(0, lastIndex) + valText.substring(lastIndex + 1);
    }
  }

  void normLat() {
    double? value = double.tryParse(valText);
    if (parseError(value)) {
      return;
    }
    var valn = value!;
    if (valn < _minLat) {
      valText = _minLat.toString();
    } else if (valn > _maxLat) {
      valText = _maxLat.toString();
    }
  }

  void normLon() {
    double? value = double.tryParse(valText);
    if (parseError(value)) {
      return;
    }
    var valn = value!;
    if (valn < _minLon) {
      valText = _minLon.toString();
    } else if (valn > _maxLon) {
      valText = _maxLon.toString();
    }
  }

  bool parseError(double? val) {
    if (val == null) {
      if (valText == "-") {
        return true;
      }
      valText = "";
      return true;
    } else {
      return false;
    }
  }
}
