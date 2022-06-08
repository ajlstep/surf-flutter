import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/const/icons.dart';
import 'package:places/const/sizes.dart';
import 'package:places/const/texts.dart';
import 'package:places/providers/themeprovide.dart';
import 'package:places/widgets/appbar/appbar.dart';
import 'package:places/widgets/bottom/bottom.dart';
import 'package:places/widgets/button/buttons.dart';
import 'package:places/widgets/divider/divider.dart';
import 'package:places/widgets/img/svg_icon.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarSettings(
        title: CTextFileds.settings,
      ),
      bottomNavigationBar: AppBottomBar(curentIndex: 2),
      body: SettingsBody(),
    );
  }
}

class SettingsBody extends StatelessWidget {
  const SettingsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppSizes.paddingCommon,
        right: AppSizes.paddingCommon,
        bottom: AppSizes.paddingCommon,
      ),
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppSizes.paddingDetailContentDivider / 2,
            ),
            child: _SettingThemeMode(),
          ),
          DividerDefault(height: 1),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppSizes.paddingCommon - 2,
            ),
            child: _SettingWatchTutorial(),
          ),
          DividerDefault(height: 1),
        ],
      ),
    );
  }
}

class _SettingWatchTutorial extends StatelessWidget {
  const _SettingWatchTutorial({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          CTextFileds.viewTutorial,
          style: theme.textTheme.bodyText1?.copyWith(
            color: theme.primaryColorDark,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.paddingSpaceBetweenIconAndText,
          ),
          child: SvgIcon(
            assetName: AppIcons.iconInfo,
            color: theme.colorScheme.tertiary,
          ),
        ),
      ],
    );
  }
}

class _SettingThemeMode extends StatelessWidget {
  const _SettingThemeMode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeProvider = context.read<ThemeProvider>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          CTextFileds.darkTheme,
          style: theme.textTheme.bodyText1?.copyWith(
            color: theme.primaryColorDark,
          ),
        ),
        CupertinoSwitch(
          value: themeProvider.isDarkTheme,
          onChanged: (newValue) {
            themeProvider.changeThemeMode(isDarkTheme: newValue);
          },
          // value: true,
          // onChanged: (newValue) {},
          activeColor: theme.colorScheme.tertiary,
          trackColor: theme.colorScheme.background,
        ),
      ],
    );
  }
}
