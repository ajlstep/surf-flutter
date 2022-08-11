import 'package:flutter/cupertino.dart';

class OverScrollGlowAbsorber extends StatelessWidget {
  const OverScrollGlowAbsorber({Key? key, required this.child})
      : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return NotificationListener(
        child: child,
        onNotification: (notification) {
          if (notification is OverscrollIndicatorNotification) {
            notification.disallowIndicator();
          }
          return false;
        });
  }
}
