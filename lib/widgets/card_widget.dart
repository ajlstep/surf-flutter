import 'package:flutter/material.dart';
import 'package:places/const/const.dart';
import '../../domain/sight.dart';
import 'package:places/widgets/decoration_image.dart';

class SightCard extends StatelessWidget {
  final Sight sight;

  const SightCard({Key? key, required this.sight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 3 / 2,
            child: DecoratedBox(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: AppImageConstructor(
                        fit: BoxFit.cover,
                        imgURL: sight.imgURL[0],
                        opacity: 0.4,
                        gradient: CGradients.whiteImageGradient)
                    .image(),
              ),
              decoration: const BoxDecoration(
                color: CColors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 3 / 2,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          ),
                        ),
                        // const SizedBox(
                        //   height: 96,
                        // ),
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
                                  overflow: TextOverflow.ellipsis,
                                  style: CTextStyles.text.copyWith(),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  sight.details,
                                  style: CTextStyles.small.copyWith(
                                    color: CColors.smallText,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
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
          ),
        ],
      ),
    );
  }
}
