import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/settings_screen.dart';
import 'package:places/ui/screen/sigh_list_sliver2.dart';
import 'package:places/ui/screen/spalsh_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';
import 'package:places/utils/data_objects/bottom_items.dart';
import 'package:places/widgets/img/svg_icon.dart';
import 'package:places/const/icons.dart';

class AppBottomBar extends StatelessWidget {
  final int curentIndex;
  const AppBottomBar({required this.curentIndex, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final barTheme = Theme.of(context).bottomNavigationBarTheme;
    var bootomItemsList = BootomItemsList();
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: curentIndex,
      onTap: (i) {
        var route = bootomItemsList.list[i].route;
        if (ModalRoute.of(context)?.settings.name != route) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(route, ModalRoute.withName('/list'));
        }
      },
      items: <BottomNavigationBarItem>[
        for (var botomItem in bootomItemsList.list)
          BottomNavigationBarItem(
            icon: SvgIcon(
              assetName: botomItem.assetName,
              height: botomItem.height,
              width: botomItem.width,
              color: _getColor(
                  curentIndex == bootomItemsList.list.indexOf(botomItem),
                  barTheme),
            ),
            label: botomItem.label,
          ),

        // BottomNavigationBarItem(
        //   icon: SvgIcon(
        //     assetName: AppIcons.menuList,
        //     height: 24,
        //     width: 24,
        //     color: _getColor(curentIndex == 0, barTheme),
        //   ),
        //   label: 'list',
        // ),
        // BottomNavigationBarItem(
        //   icon: GestureDetector(
        //     onTap: () {
        //       var route = "/settings";
        //       if (ModalRoute.of(context)?.settings.name != route) {
        //         Navigator.of(context).pushNamedAndRemoveUntil(
        //             route, ModalRoute.withName('/list'));
        //       }
        //     },
        //     child: SvgIcon(
        //       assetName: AppIcons.menuMap,
        //       height: 24,
        //       width: 24,
        //       color: _getColor(curentIndex == 1, barTheme),
        //     ),
        //   ),
        //   label: 'map',
        // ),
        // BottomNavigationBarItem(
        //   icon: GestureDetector(
        //     onTap: () {
        //       var route = "/visiting";
        //       if (ModalRoute.of(context)?.settings.name != route) {
        //         Navigator.of(context).pushNamedAndRemoveUntil(
        //             route, ModalRoute.withName('/list'));
        //       }
        //     },
        //     child: SvgIcon(
        //       assetName: AppIcons.menuHeartFull,
        //       height: 24,
        //       width: 24,
        //       color: _getColor(curentIndex == 2, barTheme),
        //     ),
        //   ),
        //   label: 'heartfull',
        // ),
        // BottomNavigationBarItem(
        //   icon: GestureDetector(
        //     onTap: () {
        //       var route = "/settings";
        //       if (ModalRoute.of(context)?.settings.name != route) {
        //         Navigator.of(context).pushNamedAndRemoveUntil(
        //             route, ModalRoute.withName('/list'));
        //       }
        //     },
        //     child: SvgIcon(
        //       assetName: AppIcons.menuSettings,
        //       height: 24,
        //       width: 24,
        //       color: _getColor(curentIndex == 3, barTheme),
        //     ),
        //   ),
        //   label: 'settings',
        // ),
      ],
    );
  }

  Color? _getColor(bool isEnabled, BottomNavigationBarThemeData barTheme) {
    return isEnabled
        ? barTheme.selectedItemColor
        : barTheme.unselectedItemColor;
  }
}
