import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/const/icons.dart';
import 'package:places/utils/data_objects/app_bar_dimensions.dart';
// import 'package:places/providers/buttonappbarprovider.dart';
import 'package:places/utils/data_objects/button_visibility.dart';
import 'package:places/widgets/button/back_button.dart';
import 'package:places/widgets/img/decoration_image.dart';
import 'package:places/const/colors.dart';
import 'package:places/const/gradients.dart';
import 'package:places/widgets/img/svg_icon.dart';
import 'package:places/widgets/tabindicator/customtabindicator.dart';
import 'package:provider/provider.dart';

class CustomSliverAppBar extends StatefulWidget {
  const CustomSliverAppBar(
      {Key? key, required this.imgURL, this.isBottomSheet = false})
      : super(key: key);
  final List<String> imgURL;
  final bool isBottomSheet;

  @override
  State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      // print(_pageController.page!.round());
      setState(() {
        _tabController.animateTo(_pageController.page!.round(),
            duration: const Duration(milliseconds: 300));
      });
    });
    _tabController = TabController(length: widget.imgURL.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 336,
      flexibleSpace: PageView(
        controller: _pageController,
        padEnds: false,
        scrollDirection: Axis.horizontal,
        children: widget.imgURL
            .map((e) => AppImageConstructor(
                  fit: BoxFit.cover,
                  imgURL: e,
                  opacity: 0.4,
                  gradient: CGradients.whiteImageGradient,
                ).image())
            .toList(),
      ),
      leading: (!widget.isBottomSheet)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 16,
                ),
                BackButtonCustom(
                  color: Theme.of(context).colorScheme.onBackground,
                  onTap: () => Navigator.pop(context),
                  size: const Size(32, 32),
                  borderRadius: 10,
                  icon: SvgIcon(
                    assetName: AppIcons.iconArrow,
                    color: theme.colorScheme.primary,
                    // height: 10,
                    // width: 10,
                  ),
                ),
              ],
            )
          : null,
      bottom: PreferredSize(
          child: CustomTabIndicator(controller: _tabController),
          preferredSize: const Size.fromHeight(7.57)),
      titleSpacing: 0,
      elevation: 0,
    );
  }
}

class AppBarCustom extends StatefulWidget implements PreferredSizeWidget {
  const AppBarCustom({Key? key, required this.imgURL})
      : preferredSize = const Size.fromHeight(336.0),
        super(key: key);

  final List<String> imgURL;
  @override
  final Size preferredSize;

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      // print(_pageController.page!.round());
      setState(() {
        _tabController.animateTo(_pageController.page!.round(),
            duration: const Duration(milliseconds: 300));
      });
    });
    _tabController = TabController(length: widget.imgURL.length, vsync: this);
  }

  // void onDragStart(DragEndDetails details) {
  //   print(details.primaryVelocity);
  //   if (details.primaryVelocity! < 0) {
  //     _pageController.nextPage(
  //       duration: const Duration(milliseconds: 300),
  //       curve: Curves.ease,
  //     );
  //   } else if (details.primaryVelocity! > 0) {
  //     _pageController.previousPage(
  //       duration: const Duration(milliseconds: 300),
  //       curve: Curves.ease,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 36,
          ),
          BackButtonCustom(
            color: Theme.of(context).colorScheme.onBackground,
            onTap: () => Navigator.pop(context),
            size: const Size(32, 32),
            borderRadius: 10,
            icon: SvgIcon(
              assetName: AppIcons.iconArrow,
              color: theme.colorScheme.primary,
              // height: 10,
              // width: 10,
            ),
          ),
        ],
      ),
      backgroundColor: CColors.green,
      toolbarHeight: 360,
      primary: false,
      // flexibleSpace: AppImageConstructor(
      //   fit: BoxFit.cover,
      //   imgURL: imgURL,
      //   opacity: 0.4,
      //   gradient: CGradients.whiteImageGradient,
      // ).image(),
      flexibleSpace: PageView(
        controller: _pageController,
        padEnds: false,
        scrollDirection: Axis.horizontal,
        children: widget.imgURL
            .map((e) => AppImageConstructor(
                  fit: BoxFit.cover,
                  imgURL: e,
                  opacity: 0.4,
                  gradient: CGradients.whiteImageGradient,
                ).image())
            .toList(),
      ),
      // bottom: TabBar(
      //   controller: _tabController,
      //   tabs: <Widget>[
      //     Container(color: Colors.green[800]),
      //     Container(color: Colors.green),
      //     Container(color: Colors.green[200]),
      //   ],
      // ),
      bottom: PreferredSize(
          child: CustomTabIndicator(controller: _tabController),
          preferredSize: const Size.fromHeight(7.57)),
      titleSpacing: 0,
      elevation: 0,
    );
  }
}

class AppBarNormal extends StatelessWidget implements PreferredSizeWidget {
  const AppBarNormal({Key? key, required this.title})
      : preferredSize = const Size.fromHeight(112.0),
        super(key: key);

  final Widget title;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      // systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
      //   statusBarColor: Colors.transparent,
      //   systemNavigationBarColor: Colors.red,
      // ),
      title: title,
      backgroundColor: CColors.white,
      elevation: 0,
      toolbarHeight: 136,
      titleSpacing: 16,
      primary: false,
    );
  }
}

class AppBarVisiting extends StatelessWidget implements PreferredSizeWidget {
  const AppBarVisiting({Key? key, required this.title, required this.bottomBar})
      : preferredSize = const Size.fromHeight(108.0),
        super(key: key);

  final Widget title;
  final PreferredSize bottomBar;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.red,
      ),
      title: title,
      backgroundColor: CColors.white,
      elevation: 0,
      toolbarHeight: 56,
      titleSpacing: 16,
      // primary: false,
      bottom: bottomBar,
    );
  }
}

class AppBarVisitingFilter extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarVisitingFilter({Key? key, required this.clearTap})
      : preferredSize = const Size.fromHeight(36.0),
        super(key: key);
  final Function() clearTap;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.red,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      toolbarHeight: 56,
      titleSpacing: 16,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).primaryColorDark,
        ),
        onPressed: () {}, // () => Navigator.of(context).pop(),
      ),
      actions: [
        TextButton(
          onPressed: clearTap,
          child: Text(
            "Очистить",
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Theme.of(context).colorScheme.tertiary),
          ),
        ),
      ],
      // primary: false,
    );
  }
}

class AppBarOnBoarding extends StatefulWidget implements PreferredSizeWidget {
  const AppBarOnBoarding(
      {Key? key, required this.skipTap, required this.buttContr})
      : preferredSize = const Size.fromHeight(36.0),
        super(key: key);
  final Function() skipTap;
  final ButtonVisibility buttContr;

  @override
  final Size preferredSize;

  @override
  State<AppBarOnBoarding> createState() => _AppBarOnBoardingState();
}

class _AppBarOnBoardingState extends State<AppBarOnBoarding> {
  bool visible = true;

  @override
  void initState() {
    widget.buttContr.stream.listen((event) {
      visible = event;
      setState(() {});
    });
    // context.read<AppBarButtonProvider>().stream.listen((event) {
    //   visible = event;
    //   setState(() {});
    // });
    super.initState();
  }

  @override
  void dispose() {
    // _streamSubscription.cancel();
    widget.buttContr.remove();
    super.dispose();
    // context.read<AppBarButtonProvider>().removeListener(() {});
  }

  void skip() {
    // dispose();
    widget.skipTap();
  }

  @override
  Widget build(BuildContext context) {
    print("rebuild appbar");
    return AppBar(
      automaticallyImplyLeading: false,
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.red,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      toolbarHeight: 56,
      titleSpacing: 16,
      // leading: IconButton(
      //   icon: Icon(
      //     Icons.arrow_back_ios,
      //     color: Theme.of(context).primaryColorDark,
      //   ),
      //   onPressed: () {}, // () => Navigator.of(context).pop(),
      // ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: visible
              ? TextButton(
                  onPressed: skip,
                  child: Text(
                    "Пропустить",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Theme.of(context).colorScheme.tertiary),
                  ),
                )
              : null,
        ),
      ],
      // primary: false,
    );
  }
}

class AppBarSettings extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSettings({Key? key, required this.title})
      : preferredSize = const Size.fromHeight(36.0),
        super(key: key);
  final String title;
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      // bottom: PreferredSize(
      //   child: widg!,
      //   preferredSize: const Size.fromHeight(56),
      // ),
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.red,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      toolbarHeight: 56,
      titleSpacing: 16,
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}

class AppBarFindSight extends StatelessWidget implements PreferredSizeWidget {
  const AppBarFindSight({Key? key, required this.title, this.widg})
      : preferredSize = const Size.fromHeight(89.0),
        super(key: key);
  final String title;
  @override
  final Size preferredSize;
  final Widget? widg;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        child: widg!,
        preferredSize: const Size.fromHeight(60),
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.red,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      toolbarHeight: 56,
      titleSpacing: 16,
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}

class SliverAppBarFindSight extends StatefulWidget
    implements PreferredSizeWidget {
  const SliverAppBarFindSight(
      {Key? key, required this.widg, required this.animData})
      : super(key: key);
  final Widget? widg;
  final AppBarAnimateData animData;

  @override
  State<SliverAppBarFindSight> createState() => _SliverAppBarFindSightState();

  @override
  Size get preferredSize => throw UnimplementedError();
}

class _SliverAppBarFindSightState extends State<SliverAppBarFindSight> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SliverAppBar(
      pinned: true,
      expandedHeight: widget.animData.width,
      // elevation: 15,
      toolbarHeight: 25,
      // titleSpacing: 0,

      // bottom: widget.widg != null
      //     ? PreferredSize(
      //         child: widget.widg!,
      //         preferredSize: widget.animData.ob
      //             ? const Size.fromHeight(60)
      //             : const Size(0, 0),
      //       )
      //     : null,
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.red,
      ),
      centerTitle: true,
      backgroundColor: theme.primaryColor,
      flexibleSpace: Align(
        alignment: FractionalOffset.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: widget.animData.border,
            ),
            Text(
              widget.animData.txt,
              style: theme.textTheme.headline4!
                  .copyWith(fontSize: widget.animData.value),
            ),
          ],
        ),
      ),
    );
  }

  Size get preferredSize => throw UnimplementedError();
}

class AppBarNewSight extends StatelessWidget implements PreferredSizeWidget {
  const AppBarNewSight({Key? key, required this.title})
      : preferredSize = const Size.fromHeight(36.0),
        super(key: key);
  final String title;
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.red,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      toolbarHeight: 40,
      titleSpacing: 16,
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
      ),
      leading: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "Отмена",
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: Theme.of(context).colorScheme.secondaryContainer),
          )),
      leadingWidth: 80,
    );
  }
}
