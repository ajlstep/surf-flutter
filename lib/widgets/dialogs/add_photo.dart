import 'package:flutter/material.dart';
import 'package:places/const/icons.dart';
import 'package:places/const/paddings.dart';
import 'package:places/const/sizes.dart';
import 'package:places/const/texts.dart';
import 'package:places/utils/sizes/vector4.dart';
import 'package:places/widgets/button/buttons.dart';
import 'package:places/widgets/divider/divider.dart';
import 'package:places/widgets/img/svg_icon.dart';

class DialogAddPhoto extends StatelessWidget {
  const DialogAddPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: AppPadding.bottomSplash,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: theme.primaryColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: getButtonList(context),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 8.0),
          child: ButtonConstructor(
            padding: const Vector4(0, 8, 0, 8, 0),
            shappe: 12,
            backgroundColor: theme.primaryColor,
            onPressed: () {
              Navigator.of(context).pop();
            },
            text: Text(
              "ОТМЕНА",
              style: theme.textTheme.subtitle1
                  ?.copyWith(color: theme.colorScheme.tertiary),
            ),
          ),
        )
      ],
    );
  }

  List<Widget> getButtonList(BuildContext context) {
    final theme = Theme.of(context);
    final liteColorTheme = theme.colorScheme.onSecondaryContainer;
    List<Widget> l = [];
    var interator = 0;
    for (var el in getList()) {
      l.add(
        ButtonConstructor(
            backgroundColor: theme.primaryColor,
            maAAlignment: MainAxisAlignment.start,
            padding: const Vector4(16, 14, 16, 14, 0),
            separatorWidth: el.separatorWidth,
            icon: SvgIcon(
              assetName: el.assetName,
              height: el.height,
              width: el.width,
              color: liteColorTheme,
            ),
            text: Text(
              GetFText(el.label).f,
              style: theme.textTheme.headline1?.copyWith(color: liteColorTheme),
            ),
            onPressed: el.exc),
      );
      l.add(Padding(
        key: Key("divider_$interator"),
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: const DividerDefault(
          height: 1,
        ),
      ));
      interator++;
    }
    l.remove(l.last);
    return l;
  }

  List<BSButton> getList() {
    return [
      BSButton(
          assetName: AppIcons.iconCamera,
          label: CButtonTexts.splashBCamera,
          exc: () {}),
      BSButton(
          assetName: AppIcons.iconPhoto,
          label: CButtonTexts.splashBPhoto,
          exc: () {}),
      BSButton(
          assetName: AppIcons.iconFile,
          label: CButtonTexts.splashBFile,
          exc: () {}),
    ];
  }
}

class BSButton {
  late final String assetName;
  late final String label;
  late final Function() exc;
  BSButton({required this.assetName, required this.label, required this.exc});

  double get height => AppSizes.paddingDetailContentDivider;
  double get width => AppSizes.paddingDetailContentDivider;
  double get separatorWidth => AppSizes.separatorWidth;
  Vector4 get vec => const Vector4(16, 14, 16, 14, 0);
}
