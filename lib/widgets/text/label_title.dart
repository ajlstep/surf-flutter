import 'package:flutter/material.dart';

class LabelTitleCustom extends StatelessWidget {
  const LabelTitleCustom({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    var th = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: th.textTheme.caption
              ?.copyWith(color: th.colorScheme.secondaryContainer),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
