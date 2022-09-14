import 'package:flutter/material.dart';

class CustomCircularIndicator extends StatefulWidget {
  const CustomCircularIndicator({
    Key? key,
    required this.tabLen,
    required this.focusColor,
    required this.unFocusColor,
    required this.radius,
    required this.width,
    required this.space,
    this.controller,
  }) : super(key: key);
  final int tabLen;
  final Color focusColor;
  final Color unFocusColor;
  final double radius;
  final double width;
  final double space;
  final CustomCircularIndicatorController? controller;

  @override
  State<CustomCircularIndicator> createState() =>
      _CustomCircularIndicatorState();
}

class _CustomCircularIndicatorState extends State<CustomCircularIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animateDimesion;
  late Animation _animateDimesionFocus;
  late Animation _animateColor;
  late Animation _animateColorFocus;
  @override
  void initState() {
    super.initState();
    widget.controller?.state = this;
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 275));
    _animateDimesion = Tween(begin: widget.radius / 1.5, end: widget.radius)
        .animate(CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.0, 1.00, curve: Curves.linear)));
    _animateDimesionFocus = Tween(begin: widget.radius / 1.5, end: widget.width)
        .animate(CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.0, 1.00, curve: Curves.linear)));
    _animateColorFocus =
        ColorTween(begin: widget.unFocusColor, end: widget.focusColor).animate(
            CurvedAnimation(
                parent: _animationController,
                curve: const Interval(0.0, 1.00, curve: Curves.linear)));
    _animateColor =
        ColorTween(begin: widget.focusColor, end: widget.unFocusColor).animate(
            CurvedAnimation(
                parent: _animationController,
                curve: const Interval(0.0, 1.00, curve: Curves.linear)));
    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.forward();
  }

  void animateTo(int index) {
    // setState(() {
    _animationController.reset();
    // widget.curentIndex = index;
    _animationController.forward();
    // });
  }

  Widget getFocused() {
    return Container(
      width: _animateDimesionFocus.value,
      height: _animateDimesion.value,
      decoration: BoxDecoration(
        color: _animateColorFocus.value,
        borderRadius: BorderRadius.circular(widget.radius),
      ),
    );
  }

  Widget getUnfocused() {
    return Container(
      width: _animateDimesion.value, // widget.radius,
      height: widget.radius,
      decoration: BoxDecoration(
        color: _animateColor.value,
        borderRadius: BorderRadius.circular(widget.radius),
      ),
    );
  }

  List<Widget> getIndicators() {
    List<Widget> indicators = [];
    for (int i = 0; i < widget.tabLen; i++) {
      if (i == widget.controller?.curentIndex) {
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
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: widget.radius,
        maxWidth: widget.radius * widget.tabLen +
            widget.space * (widget.tabLen - 1) +
            widget.width,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: getIndicators(),
        ),
      ),
    );
  }
}

class CustomCircularIndicatorController {
  late _CustomCircularIndicatorState? state;
  int curentIndex = 0;
  CustomCircularIndicatorController({this.state, this.curentIndex = 0});
  void animateTo(int index) {
    if (curentIndex != index) {
      curentIndex = index;
      state?.animateTo(index);
    }
  }
}
