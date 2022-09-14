import 'package:flutter/material.dart';

class CustomCircularIndicator extends StatefulWidget {
  CustomCircularIndicator({
    Key? key,
    required this.tabLen,
    required this.focusColor,
    required this.unFocusColor,
    required this.radius,
    required this.width,
    required this.space,
    required this.curentIndex,
    this.controller,
  }) : super(key: key);
  final int tabLen;
  final Color focusColor;
  final Color unFocusColor;
  final double radius;
  final double width;
  final double space;
  final CustomCircularIndicatorController? controller;
  int curentIndex;

  @override
  State<CustomCircularIndicator> createState() =>
      _CustomCircularIndicatorState();
}

class _CustomCircularIndicatorState extends State<CustomCircularIndicator> {
  @override
  void initState() {
    super.initState();
    widget.controller?.state = this;
  }

  void animateTo(int index) {
    setState(() {
      widget.curentIndex = index;
    });
  }

  Widget getFocused() {
    return Container(
      width: widget.width,
      height: widget.radius,
      decoration: BoxDecoration(
        color: widget.focusColor,
        borderRadius: BorderRadius.circular(widget.radius),
      ),
    );
  }

  Widget getUnfocused() {
    return Container(
      width: widget.radius,
      height: widget.radius,
      decoration: BoxDecoration(
        color: widget.unFocusColor,
        shape: BoxShape.circle,
      ),
    );
  }

  List<Widget> getIndicators() {
    List<Widget> indicators = [];
    for (int i = 0; i < widget.tabLen; i++) {
      if (i == widget.curentIndex) {
        indicators.add(getFocused());
      } else {
        indicators.add(getUnfocused());
      }
      if (i != widget.tabLen - 1) indicators.add(SizedBox(width: widget.space));
    }
    return indicators;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: getIndicators(),
      ),
    );
  }
}

class CustomCircularIndicatorController {
  late _CustomCircularIndicatorState? state;
  CustomCircularIndicatorController({this.state});
  void animateTo(int index) {
    state?.animateTo(index);
  }
}
