import 'package:flutter/material.dart';
import 'package:places/const/colors.dart';
import 'package:places/widgets/img/svg_icon.dart';
import 'package:places/const/icons.dart';
import 'package:places/const/texts.dart';
import 'package:places/const/textstyle.dart';

class EmptyBody extends StatelessWidget {
  final String icon;
  final String titleText;
  final String text;
  const EmptyBody(
      {Key? key,
      required this.icon,
      required this.text,
      required this.titleText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 53,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgIcon(
              assetName: icon,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              titleText,
              style: CTextStyles.subtitle.copyWith(
                color: CColors.incativeBlack.withOpacity(0.56),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              text,
              style: CTextStyles.small.copyWith(
                color: CColors.incativeBlack.withOpacity(0.56),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
