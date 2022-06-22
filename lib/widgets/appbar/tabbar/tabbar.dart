import 'package:flutter/material.dart';
import 'package:places/const/colors.dart';

class TabBarVisitingWidget extends StatelessWidget {
  final List<Widget> tablist;
  const TabBarVisitingWidget({Key? key, required this.tablist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 6,
      ),
      height: 40,
      decoration: BoxDecoration(
        color: CColors.backGround,
        borderRadius: BorderRadius.circular(40),
      ),
      child: TabBar(
        labelStyle: Theme.of(context).textTheme.subtitle1,
        // labelColor: CColors.white,
        unselectedLabelColor: CColors.textColor,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: CColors.textColor,
        ),
        tabs: tablist,
      ),
    );
  }

  Size get preferredSize => const Size.fromHeight(40.0);
}
