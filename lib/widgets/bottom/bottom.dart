import 'package:flutter/material.dart';
import 'package:places/widgets/img/svg_icon.dart';
import 'package:places/const/icons.dart';

class AppBottomBar extends StatelessWidget {
  final int curentIndex;
  const AppBottomBar({required this.curentIndex, Key? key}) : super(key: key);

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
            assetName: AppIcons.menuList,
            height: 24,
            width: 24,
            color: _getColor(curentIndex == 0, barTheme),
          ),
          label: 'list',
        ),
        BottomNavigationBarItem(
          icon: SvgIcon(
            assetName: AppIcons.menuMap,
            height: 24,
            width: 24,
            color: _getColor(curentIndex == 1, barTheme),
          ),
          label: 'map',
        ),
        BottomNavigationBarItem(
          icon: SvgIcon(
            assetName: AppIcons.menuHeartFull,
            height: 24,
            width: 24,
            color: _getColor(curentIndex == 2, barTheme),
          ),
          label: 'heartfull',
        ),
        BottomNavigationBarItem(
          icon: SvgIcon(
            assetName: AppIcons.menuSettings,
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
