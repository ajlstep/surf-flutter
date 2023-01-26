import 'dart:io';

import 'package:flutter/material.dart';
import 'package:places/const/icons.dart';
import 'package:places/const/paddings.dart';
import 'package:places/const/sizes.dart';
import 'package:places/const/texts.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/screen/sight_search_screen.dart';
import 'package:places/utils/data_objects/app_bar_dimensions.dart';
import 'package:places/utils/sizes/vector4.dart';
import 'package:places/widgets/bottom/bottom.dart';
import 'package:places/widgets/button/buttons.dart';
import 'package:places/widgets/card/card_widget.dart';
import 'package:places/mocks.dart';
import 'package:places/widgets/appbar/appbar.dart';
import 'package:places/widgets/img/svg_icon.dart';
import 'package:places/widgets/text_field/textfield.dart';

class SlidingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SlidingAppBar({
    Key? key,
    required this.child,
    required this.controller,
    required this.visible,
  }) : super(key: key);

  final PreferredSizeWidget child;
  final AnimationController controller;
  final bool visible;

  @override
  Size get preferredSize => child.preferredSize;

  @override
  Widget build(BuildContext context) {
    visible ? controller.reverse() : controller.forward();
    return SlideTransition(
      position:
          Tween<Offset>(begin: Offset.zero, end: const Offset(0, -1)).animate(
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
      ),
      child: child,
    );
  }
}

class SightListScreenSliver2 extends StatefulWidget {
  const SightListScreenSliver2({Key? key}) : super(key: key);

  @override
  State<SightListScreenSliver2> createState() => _SightListScreenSliver2State();
}

class _SightListScreenSliver2State extends State<SightListScreenSliver2>
    with SingleTickerProviderStateMixin {
  TextEditingController controller = TextEditingController();
  final ScrollController _contr = ScrollController();
  late final AnimationController _controller;
  late AppBarAnimateData animData;
  final double width = 115;

  @override
  void initState() {
    animData = AppBarAnimateData(
      setState: () {
        setState(() {});
      },
      maxValue: 32,
      minValue: 18,
      maxValue2: 64,
      minValue2: 20,
      width: width,
      isDesktop: Platform.isLinux || Platform.isWindows || Platform.isMacOS,
    )..obst = width / 1.6;
    _contr.addListener(() {
      animData.mutval = _contr.offset;
      setState(() {});
    });
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    controller.addListener(() {
      controller.text = "";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        controller: _contr,
        slivers: [
          SliverAppBarFindSight(
            animData: animData,
            widg: null,
          ),
          SliverToBoxAdapter(
            child: SlidingAppBar(
              child: AppBar(
                flexibleSpace: searchWidget(),
                elevation: 0,
                toolbarHeight: 0,
                titleSpacing: 0,
              ),
              controller: _controller,
              visible: animData.ob,
            ),
          ),
          const SightListSliverBody(),
        ],
      ),
      floatingActionButton: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 48, maxWidth: 177),
        child: ButtonConstructor(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AddSightScreen(),
              ),
            );
          },
          text: Text(
            CTextFileds.newPlace,
            style: theme.textTheme.subtitle1
                ?.copyWith(color: theme.colorScheme.onPrimary),
          ),
          icon: SvgIcon(
            assetName: AppIcons.iconPlus,
            color: theme.colorScheme.onPrimary,
          ),
          separatorWidth: 8,
          shappe: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: const AppBottomBar(curentIndex: 0),
    );
  }

  Widget searchWidget() {
    var theme = Theme.of(context);
    return Padding(
      padding: AppPadding.inputWidgetsInternPadding,
      child: TextFieldDesigned(
        onTap: () {
          print("object");
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const SightSearchScreen(),
            ),
          );
        },
        hintText: "Пойск",
        filled: true,
        predBorderDecoration: false,
        filledColor: theme.backgroundColor,
        controller: controller,
        maxLenght: 250,
        suffixWidget: SvgButtonCustom2(
            icon: AppIcons.iconFilter,
            iconColor: theme.colorScheme.tertiary,
            interiorPadding: const Vector4(8, 8, 8, 8, 0),
            splashColor:
                Theme.of(context).colorScheme.background.withOpacity(1),
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const FiltersScreen()))),
        prefixIcon: Padding(
          padding: AppPadding.searchWidgetIcon,
          child: SvgIcon(
            assetName: AppIcons.iconSearch,
            color: theme.disabledColor,
            height: AppSizes.paddingDetailContentDivider,
            width: AppSizes.paddingDetailContentDivider,
          ),
        ),
      ),
    );
  }
}

class SightListSliverBody extends StatelessWidget {
  const SightListSliverBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return SliverList(
    //   delegate:
    //       SliverChildListDelegate(List.generate(mocksPredef.length, (index) {
    //     return SightCard(sight: mocksPredef[index]);
    //   })),
    // );

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: getNymCol(context),
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0),
      // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
      //   maxCrossAxisExtent: 550.0,
      //   mainAxisSpacing: 0.0,
      //   crossAxisSpacing: 0.0,
      //   childAspectRatio: 1.4,
      // ),
      delegate:
          SliverChildListDelegate(List.generate(mocksPredef.length, (index) {
        return SightCard(sight: mocksPredef[index]);
      })),
    );
  }
}

int getNymCol(BuildContext context) {
  // if (MediaQuery.of(context).size.height / MediaQuery.of(context).size.width >
  //     1.7) {
  //   return 1;
  // } else {
  //   return 2;
  // }
  return MediaQuery.of(context).orientation == Orientation.portrait ? 1 : 2;
}
