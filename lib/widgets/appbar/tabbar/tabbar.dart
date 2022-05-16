import 'package:flutter/material.dart';
import 'package:places/const/textstyle.dart';
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
        labelStyle: CTextStyles.smallBold,
        labelColor: CColors.white,
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

class TabBarVisitingClass {
  final Size preferredSize = const Size.fromHeight(40.0);
  final List<Widget> tablist;
  TabBarVisitingClass({required this.tablist});

  PreferredSize build() {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 6,
        ),
        height: 40,
        decoration: BoxDecoration(
          color: CColors.backGround,
          borderRadius: BorderRadius.circular(40),
        ),
        child: TabBar(
          labelStyle: CTextStyles.smallBold,
          labelColor: CColors.white,
          unselectedLabelColor: CColors.textColor,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: CColors.textColor,
          ),
          tabs: tablist,
        ),
      ),
    );
  }
}
