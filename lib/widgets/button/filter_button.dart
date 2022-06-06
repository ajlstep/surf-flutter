import 'package:flutter/material.dart';
import 'package:places/const/icons.dart';
import 'package:places/domain/sight.dart';
import 'package:places/widgets/img/svg_icon.dart';

class FilterButton extends StatelessWidget {
  final Function() onTap;
  final Widget? firstIcon;
  final Widget? secondIcon;
  final Size boxSize;
  final Size firstSize;
  final Size secondSize;
  final Color? firstColor;
  final Color? secondColor;
  final Color? splashColor;
  final bool visible;
  final String? labelText;

  const FilterButton(
      {Key? key,
      required this.onTap,
      required this.boxSize,
      required this.firstSize,
      required this.secondSize,
      this.firstIcon,
      this.secondIcon,
      this.firstColor,
      this.secondColor,
      this.splashColor,
      this.visible = false,
      this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: boxSize.height,
            maxWidth: boxSize.width,
          ),
          child: Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              ClipOval(
                child: Material(
                  color: firstColor, // Button color
                  child: InkWell(
                    splashColor: splashColor, // Splash color
                    onTap: onTap,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: (boxSize.height - firstSize.height) / 2,
                        horizontal: (boxSize.width - firstSize.width) / 2,
                      ),
                      child: firstIcon,
                    ),
                  ),
                ),
              ),
              if (visible)
                Align(
                  child: ClipOval(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: secondColor,
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: secondSize.height,
                          maxWidth: secondSize.width,
                        ),
                        child: secondIcon,
                      ),
                    ),
                  ),
                  alignment: AlignmentDirectional.bottomEnd,
                ),
            ],
          ),
        ),
        /*
        if (labelText != null)
          const SizedBox(
            height: 12,
          ),
        if (labelText != null)
          Text(
            labelText!,
            style: Theme.of(context).textTheme.caption,
          ),*/
      ],
    );
  }
}

class FilterButtonColored extends StatelessWidget {
  final Function() onTap;
  final String firstIcon;
  final String secondIcon;
  final bool visible;
  final BuildContext context;

  const FilterButtonColored(
      {Key? key,
      required this.onTap,
      required this.firstIcon,
      required this.secondIcon,
      this.visible = true,
      required this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 64,
        maxWidth: 64,
      ),
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          ClipOval(
            child: Material(
              color: Theme.of(context)
                  .colorScheme
                  .tertiary
                  .withOpacity(0.16), // Button color
              child: InkWell(
                // splashColor: splashColor, // Splash color
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  child: SvgIcon(
                    assetName: firstIcon,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ),
            ),
          ),
          if (visible)
            Align(
              child: ClipOval(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 16,
                      maxWidth: 16,
                    ),
                    child: SvgIcon(assetName: secondIcon),
                  ),
                ),
              ),
              alignment: AlignmentDirectional.bottomEnd,
            ),
        ],
      ),
    );
  }
}

class FilterButtonPredefined extends FilterButton {
  final Function() onTaps;
  final BuildContext context;
  final TypeSyght sight;
  FilterButtonPredefined({
    Key? key,
    required this.onTaps,
    required this.context,
    bool visible = false,
    required this.sight,
  }) : super(
          key: key,
          boxSize: const Size(64, 64),
          firstSize: const Size(32, 32),
          secondSize: const Size(16, 16),
          onTap: onTaps,
          firstColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.16),
          secondColor: Theme.of(context).colorScheme.primary,
          firstIcon: SvgIcon(
            assetName: sight.imgUrl,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          secondIcon: const SvgIcon(assetName: AppIcons.iconTick),
          visible: visible,
          labelText: sight.name,
        );
}
