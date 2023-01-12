import 'package:flutter/material.dart';
import 'package:places/const/gradients.dart';
import 'package:places/const/sizes.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/sight_detailed.dart';
import 'package:places/widgets/divider/divider.dart';
import 'package:places/widgets/img/decoration_image.dart';

class MinSightCardv2 extends StatelessWidget {
  final Sight sight;
  final String text;
  final bool ifLast;
  final bool ifOne;
  const MinSightCardv2(
      {Key? key,
      required this.sight,
      required this.ifLast,
      required this.text,
      required this.ifOne})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Expanded(
    //   child: SizedBox(
    //     width: 50,
    //     height: 50,
    //     child: AppImageConstructor(
    //       imgURL: sight.imgURL[0],
    //       fit: BoxFit.cover,
    //       opacity: 0.4,
    //       gradient: CGradients.whiteImageGradient,
    //     ).image(),
    //   ),
    // );
    var theme = Theme.of(context);
    return Stack(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 11, 16, 11),
                    child: ClipRRect(
                      borderRadius: AppSizes.borderCircular15,
                      child: SizedBox(
                        width: 56,
                        height: 56,
                        child: AppImageConstructor(
                          imgURL: sight.imgURL[0],
                          fit: BoxFit.cover,
                          opacity: 0.4,
                          gradient: CGradients.whiteImageGradient,
                        ).image(),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      RichTextForSearch(
                        findText: text,
                        text: sight.name,
                      ),
                      // Text(
                      //   sight.name,
                      //   style: theme.textTheme.headline1,
                      //   maxLines: 1,
                      //   overflow: TextOverflow.clip,
                      // ),
                      Text(
                        sight.type.name,
                        style: theme.textTheme.bodyText2,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (!ifLast && !ifOne)
              Row(
                children: [
                  Expanded(
                    child: Container(),
                    flex: 17,
                  ),
                  Expanded(
                    flex: 72,
                    child: Container(
                      height: 1,
                      color: const Color(0xff7C7E92).withOpacity(0.56),
                    ),
                  ),
                ],
              ),
          ],
        ),
        Positioned.fill(
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              highlightColor:
                  Theme.of(context).colorScheme.background.withOpacity(0.15),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailedPlace(
                          sight: sight,
                          controller: ScrollController(),
                        )));
              },
            ),
          ),
        ),
      ],
    );
  }
}

class MinSightCard extends StatelessWidget {
  final Sight sight;
  const MinSightCard({Key? key, required this.sight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 6 / 2,
          child: SomeCardMinSightCard(sight: sight),
        ),
      ],
    );
  }
}

class SomeCardMinSightCardTest extends StatelessWidget {
  final Sight sight;
  const SomeCardMinSightCardTest({Key? key, required this.sight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: theme.primaryColorLight,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: AppImageConstructor(
              imgURL: sight.imgURL[0],
              // fit: BoxFit.cover,
              opacity: 0.4,
              gradient: CGradients.whiteImageGradient,
            ).image(),
          ),
        ),
      ],
    );
  }
}

class SomeCardMinSightCard extends StatelessWidget {
  final Sight sight;
  const SomeCardMinSightCard({Key? key, required this.sight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 11, 16, 11),
                  child: SizedBox(
                    height: 56,
                    width: 56,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: theme.primaryColorLight,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: AppImageConstructor(
                        imgURL: sight.imgURL[0],
                        fit: BoxFit.cover,
                        opacity: 0.4,
                        gradient: CGradients.whiteImageGradient,
                      ).image(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: Column(
              children: const [
                Text("data1"),
                Text("data2"),
                DividerDefault(
                  height: 1,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class RichTextForSearch extends StatelessWidget {
  final String text;
  final String findText;
  // final TextStyle textStyle;
  const RichTextForSearch({
    Key? key,
    required this.text,
    required this.findText,
    // required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.clip,
      text: TextSpan(
        text: '',
        // style: theme.textTheme.headline1,
        // style: theme.textTheme.headline3,
        children: _getList(theme),
      ),
    );
  }

  List<TextSpan> _getList(ThemeData theme) {
    var txtTheme2 = theme.textTheme.bodyText1;
    List<TextSpan> txtSpanList = [];
    var reg = RegExp(findText, caseSensitive: false);
    final matches = reg.allMatches(text);
    int nowInterator = 0;
    int lastInterator = 0;
    for (var element in matches) {
      if (element.start > nowInterator) {
        txtSpanList.add(
          TextSpan(
              text: text.substring(nowInterator, element.start),
              style: theme.textTheme.caption),
        );
      }
      txtSpanList.add(
        TextSpan(
            text: text.substring(element.start, element.end), style: txtTheme2),
      );
      nowInterator = element.end;
    }

    if (nowInterator != text.length - 1) {
      txtSpanList.add(
        TextSpan(
            text: text.substring(nowInterator), style: theme.textTheme.caption),
      );
    }

    return txtSpanList;
  }
}
