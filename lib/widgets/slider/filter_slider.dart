import 'package:flutter/material.dart';
import 'package:places/const/texts.dart';
import 'package:places/providers/filterprovider.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:provider/provider.dart';

class FilterSlider extends StatefulWidget {
  FilterSlider({
    Key? key,
    required this.startValue,
    required this.endValue,

    // this.activeColor,
    // this.inactiveColor,
    this.label,
    this.labelOnChange,
    this.from = "от",
    this.to = "до",
    this.dinstance = CTextFileds.distance,
  }) : super(key: key);

  // final Color? activeColor;
  // final Color? inactiveColor;
  double startValue;
  double endValue;

  final String from;
  final String to;
  final String dinstance;

  Widget? label;
  final Function()? labelOnChange;

  @override
  State<FilterSlider> createState() => _FilterSliderState();
}

class _FilterSliderState extends State<FilterSlider> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Filters>(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.dinstance,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: Theme.of(context).primaryColorDark),
            ),
            Text(
                "${widget.from} ${getDistance(provider.distanceStart)} ${widget.to} ${getDistance(provider.distanceEnd)}"),
          ],
        ),
        SliderTheme(
          // data: SliderTheme.of(context).copyWith(
          //   // rangeTrackShape: const RectangularRangeSliderTrackShape(),
          //   // thumbShape: const RoundSliderThumbShape(
          //   //   disabledThumbRadius: 20,
          //   //   enabledThumbRadius: 50,
          //   //   elevation: 1,
          //   //   pressedElevation: 6,
          //   // ),
          //   // overlayColor: Colors.black,
          //   // overlayShape: RoundSliderOverlayShape(overlayRadius: 10),
          //   // valueIndicatorShape: PaddleSliderValueIndicatorShape(),
          //   // overlappingShapeStrokeColor: Colors.black,
          //   // tickMarkShape: SliderTickMarkShape.noTickMark,
          //   // thumbColor: Colors.white,
          //   // overlayColor: Colors.white,
          //   // valueIndicatorColor: Colors.white,
          //   // activeTickMarkColor: Colors.white,
          // ),
          data: Theme.of(context).sliderTheme,
          // rangeTrackShape: const RectangularRangeSliderTrackShape(),
          // thumbShape: const RoundSliderThumbShape(
          //   disabledThumbRadius: 20,
          //   enabledThumbRadius: 50,
          //   elevation: 1,
          //   pressedElevation: 6,
          // ),
          // overlayColor: Colors.black,
          // overlayShape: RoundSliderOverlayShape(overlayRadius: 10),
          // valueIndicatorShape: PaddleSliderValueIndicatorShape(),
          // overlappingShapeStrokeColor: Colors.black,
          // tickMarkShape: SliderTickMarkShape.noTickMark,
          // thumbColor: Colors.white,
          // overlayColor: Colors.white,
          // valueIndicatorColor: Colors.white,
          // activeTickMarkColor: Colors.white,
          child: RangeSlider(
            min: widget.startValue,
            max: widget.endValue,
            activeColor: Theme.of(context).colorScheme.tertiary,
            inactiveColor:
                Theme.of(context).colorScheme.background.withOpacity(0.56),
            values: RangeValues(provider.distanceStart, provider.distanceEnd),
            onChanged: (values) {
              provider.changeDistance(values.start, values.end);
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  String getDistance(double val) {
    if (val >= 1000) {
      return (val / 1000).toStringAsFixed(2) + " km";
    } else {
      return val.toStringAsFixed(2) + " m";
    }
  }
}

// class FilterSliderDecorated extends FilterSlider {
//   final BuildContext context;
//   double nowStartValue;
//   double nowEndValue;
//   FilterSliderDecorated(
//       {Key? key,
//       required double startValue,
//       required double endValue,
//       required this.nowEndValue,
//       required this.nowStartValue,
//       required Function(double p1, double p2) onChange,
//       required this.context})
//       : super(
//           key: key,
//           startValue: startValue,
//           endValue: endValue,
//           onChange: onChange,
//           nowStartValue: nowStartValue,
//           nowEndValue: nowEndValue,
//           inactiveColor:
//               Theme.of(context).colorScheme.background.withOpacity(0.56),
//           activeColor: Theme.of(context).colorScheme.tertiary,
//         );
// }
