import 'package:flutter/material.dart';
import 'package:places/const/const.dart';
import '../../domain/sight.dart';

// Widget getWidget(Sight sight) {
//   final Sight _sight;
//   _sight = sight;

//   return Widget();
// }

class CardWidget extends StatelessWidget {
  final Sight sight;

  const CardWidget({Key? key, required this.sight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: CColors.white,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          image: DecorationImage(
            image: NetworkImage(sight.imgURL),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    sight.type.name.toString(),
                    style: CTextStyles.smallBold.copyWith(
                      color: CColors.white,
                      //     foreground: Paint()
                      //       ..style = PaintingStyle.stroke
                      //       ..strokeWidth = 0
                      //       ..color = const Color.fromARGB(255, 136, 255, 0)),
                    ),
                  ),
                  const SizedBox(
                    height: 96,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                        0, 28 - 9.5 - 16, 28 - 9.5 - 16, 0),
                    child: Container(
                      width: 19,
                      height: 19,
                      color: const Color.fromARGB(255, 144, 226, 77),
                    ),
                  ),
                ],
              ),
            ),
            DecoratedBox(
              decoration: const BoxDecoration(
                color: CColors.backGround,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // const SizedBox(
                    //   height: 96,
                    // ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            sight.name,
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                            style: CTextStyles.text.copyWith(
                                // color: CColors.white,
                                ),
                          ),
                          Text(
                            sight.details,
                            style: CTextStyles.small.copyWith(
                              color: CColors.smallText,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
