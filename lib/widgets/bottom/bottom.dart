import 'package:flutter/material.dart';
import 'package:places/const/colors.dart';
import 'package:places/widgets/img/svg_icon.dart';
import 'package:places/const/icons.dart';

class AppBottomBar extends StatelessWidget {
  late int curentIndex;
  AppBottomBar({required this.curentIndex, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: curentIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgIcon(
              assetName: CIcons.list,
              height: 24,
              width: 24,
              color: CColors.secondary),
          label: 'list',
        ),
        BottomNavigationBarItem(
          icon: SvgIcon(
              assetName: CIcons.map,
              height: 24,
              width: 24,
              color: CColors.secondary),
          label: 'map',
        ),
        BottomNavigationBarItem(
          icon: SvgIcon(
              assetName: CIcons.heartfull,
              height: 24,
              width: 24,
              color: CColors.secondary),
          label: 'heartfull',
        ),
        BottomNavigationBarItem(
          icon: SvgIcon(
              assetName: CIcons.settings,
              height: 24,
              width: 24,
              color: CColors.secondary),
          label: 'settings',
        ),
      ],
    );
  }
}
