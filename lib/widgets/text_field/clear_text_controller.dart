import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/widgets/button/but_in_textfield.dart';

class ClearTextController {
  TextEditingController? controller;
  Widget? clearButton;
  List<TextInputFormatter>? inputFormaters;
  final String? text;
  final Function(String)? fChange;
  final Function(String)? fSubmite;

  ClearTextController({
    this.clearButton,
    this.controller,
    this.inputFormaters,
    this.text,
    this.fChange,
    this.fSubmite,
  }) {
    controller ??= TextEditingController(text: text);
    clearButton ??= ClearButtonForController(
      onClear: onClear,
    );
  }

  void onClear() {
    controller?.text = "";
  }

  void onChanged(String text) {
    // controller?.text = text;
    if (fChange != null) {
      controller?.text = fChange!(text);
    }
  }
}
