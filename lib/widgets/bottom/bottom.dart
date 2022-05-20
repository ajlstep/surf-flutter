import 'package:flutter/material.dart';
import 'package:places/const/colors.dart';
import 'package:places/widgets/img/svg_icon.dart';
import 'package:places/const/icons.dart';

class AppBottomBar extends StatelessWidget {
  late int curentIndex;
  AppBottomBar({required this.curentIndex, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final barTheme = Theme.of(context).bottomNavigationBarTheme;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: curentIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgIcon(
            assetName: CIcons.list,
            height: 24,
            width: 24,
            color: _getColor(curentIndex == 0, barTheme),
          ),
          label: 'list',
        ),
        BottomNavigationBarItem(
          icon: SvgIcon(
            assetName: CIcons.map,
            height: 24,
            width: 24,
            color: _getColor(curentIndex == 1, barTheme),
          ),
          label: 'map',
        ),
        BottomNavigationBarItem(
          icon: SvgIcon(
            assetName: CIcons.heartfull,
            height: 24,
            width: 24,
            color: _getColor(curentIndex == 2, barTheme),
          ),
          label: 'heartfull',
        ),
        BottomNavigationBarItem(
          icon: SvgIcon(
            assetName: CIcons.settings,
            height: 24,
            width: 24,
            color: _getColor(curentIndex == 3, barTheme),
          ),
          label: 'settings',
        ),
      ],
    );
  }

  Color? _getColor(bool isEnabled, BottomNavigationBarThemeData barTheme) {
    return isEnabled
        ? barTheme.selectedItemColor
        : barTheme.unselectedItemColor;
  }
}
