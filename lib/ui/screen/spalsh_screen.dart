import 'package:flutter/material.dart';
import 'package:places/const/icons.dart';
import 'package:places/ui/screen/onboarding_screen.dart';
import 'package:places/ui/screen/sigh_list_sliver2.dart';
import 'package:places/ui/screen/tstapp.dart';
import 'package:places/utils/data_objects/app_data.dart';
import 'package:places/widgets/img/svg_icon.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    print("init state");
    super.initState();
    _navigateToNext();
    print("end state");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    var theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Container(
            decoration: BoxDecoration(color: theme.colorScheme.tertiary),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: SizedBox(
                width: 160,
                height: 160,
                child: SvgIcon(
                  assetName: AppIcons.iconSplash,
                  color: theme.backgroundColor,
                ),
              ),
            )),
      ),
    );
  }

  Future<void> _navigateToNext() async {
    // print("init delayed");
    // await Future.delayed(const Duration(seconds: 2));
    // print("end delayed");
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     // builder: (context) => const SightListScreenSliver2(),
    //     builder: (context) => const TestPages(),
    //   ),
    // );
    Future.delayed(
      const Duration(seconds: 3),
    ).then(
      (value) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            // builder: (context) => const SightListScreenSliver2(),
            builder: (context) {
              if (AppAuxData().ifFirstOpen) {
                return OnboardingScreen();
              } else {
                return const SightListScreenSliver2();
              }
            },
          ),
        );
      },
    );
  }
}
