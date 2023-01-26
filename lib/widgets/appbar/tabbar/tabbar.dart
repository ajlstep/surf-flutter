import 'package:flutter/material.dart';
import 'package:places/const/colors.dart';

class TabBarVisitingWidget extends StatelessWidget {
  final List<Widget> tablist;
  const TabBarVisitingWidget({Key? key, required this.tablist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 6,
      ),
      height: 40,
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        // color: Colors.yellow,
        borderRadius: BorderRadius.circular(40),
      ),
      child: TabBar(
        labelStyle: theme.textTheme.subtitle1,
        // labelColor: CColors.white,
        unselectedLabelColor: theme.primaryColorDark,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: theme.primaryColorDark,
        ),
        tabs: tablist,
        splashBorderRadius: BorderRadius.circular(40),
      ),
    );
  }

  Size get preferredSize => const Size.fromHeight(40.0);
}
