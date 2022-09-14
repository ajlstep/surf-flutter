import 'dart:async';

import 'package:flutter/cupertino.dart';

class AppBarButtonProvider extends ChangeNotifier {
  bool _isVisible = true;
  final streamController = StreamController<bool>();
  late Stream stream;
  AppBarButtonProvider() {
    stream = streamController.stream;
    streamController.add(_isVisible);
  }

  void setVisible() {
    if (!_isVisible) {
      streamController.add(!_isVisible);
    }
    _isVisible = true;
  }

  void setInvisible() {
    if (_isVisible) {
      streamController.add(!_isVisible);
    }
    _isVisible = false;
  }
}
