import 'package:flutter/material.dart';
import 'package:places/const/const.dart';
import '../../mocks.dart';
import '../../domain/sight.dart';
import 'dart:math' as math;
import '../../widgets/card_widget.dart';

class SightCard extends StatelessWidget {
  final Sight sight;
  static const double edgeInset = 16;
  const SightCard({Key? key, required this.sight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 188,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.teal,
          // color: RndColor.rndColor,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  const SizedBox(
                    width: edgeInset,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: edgeInset,
                        ),
                        Text(
                          sight.type.name.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(
                          height: edgeInset,
                        ),
                        Container(
                          width: 25,
                          height: 25,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: edgeInset,
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Text(
                          sight.name,
                          style: CTextStyles.text,
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Text(
                          sight.lat.toString(),
                          style: CTextStyles.smallBold
                              .copyWith(color: CColors.subTextColor),
                        ),
                      ),
                      Text(
                        sight.lon.toString(),
                        style: CTextStyles.smallBold
                            .copyWith(color: CColors.subTextColor),
                      ),
                    ],
                  ),
                ],
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> getListCards() {
  List<Widget> list = [];
  Mocks mocks = Mocks();
  for (var item in mocks.mocks) {
    list.add(CardWidget(sight: item));
  }
  return list;
}

Color getRandomColor() {
  // var rng = Random();
  // var col =
  //     Color.fromARGB(255, rng.nextInt(255), rng.nextInt(255), rng.nextInt(255));
  // return col;
  final s =
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  return s;
}

abstract class RndColor {
  static const colors = [
    Color(0xFFFD9841),
    Color(0xFFF9D562),
    Color(0xFFFFDBB4),
    Color(0xFFEDB98A),
    Color(0xFFD08B5B),
    Color(0xFFAE5D29),
    Color(0xFF614335),
  ];
  static Color get rndColor => colors[math.Random().nextInt(colors.length - 1)];
}
