import 'dart:async';

class ButtonVisibility {
  late bool visible;
  StreamController _stream = StreamController<bool>();
  ButtonVisibility({required this.visible});

  Stream<dynamic> get stream => _stream.stream;

  void setT() {
    if (visible) {
      return;
    }
    visible = true;
    modify();
  }

  void setF() {
    if (!visible) {
      return;
    }
    visible = false;
    modify();
  }

  void modify() {
    _stream.add(visible);
  }

  void remove() {
    _stream.close();
    _stream = StreamController<bool>();
  }
}
