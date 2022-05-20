import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/widgets/img/decoration_image.dart';
import 'package:places/const/colors.dart';
import 'package:places/const/gradients.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({Key? key, required this.imgURL})
      : preferredSize = const Size.fromHeight(336.0),
        super(key: key);

  final String imgURL;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CColors.green,
      toolbarHeight: 360,
      primary: false,
      flexibleSpace: AppImageConstructor(
        fit: BoxFit.cover,
        imgURL: imgURL,
        opacity: 0.4,
        gradient: CGradients.whiteImageGradient,
      ).image(),
      titleSpacing: 0,
      elevation: 0,
      title: SizedBox(
        width: double.infinity,
        height: 360,
        child: Stack(
          children: [
            Positioned(
              top: 38,
              left: 16,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: CColors.white,
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: CColors.textColor,
                  size: 36,
                ),
              ),
            ),
          ],
        ),
      ),
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