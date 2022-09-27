import 'package:flutter/material.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/screen/onboarding_screen.dart';
import 'package:places/ui/screen/settings_screen.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/tst.dart';
import 'package:places/ui/screen/tst2.dart';
import 'package:places/ui/screen/tst3.dart';
import 'package:places/ui/screen/visiting_screen.dart';
import 'package:places/mocks.dart';

class TestPages extends StatelessWidget {
  const TestPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("test app"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // list.forEach((key, value) {  })
            for (var el in list.entries) getWidg(el.key, el.value, context)
          ],
        ),
      ),
    );
  }

  Widget getWidg(String name, Widget widg, BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => widg),
        );
      },
      child: Text(name),
    );
  }
}

var list = {
  "sight list": const SightListScreen(),
  "visit list": VisitingScreen(visitList: VisitList),
  "filter screen": const FiltersScreen(),
  "settings page": const SettingsPage(),
  "test page1": const TestPAge(),
  "test page2": const TestPage2(),
  "test page3": MyHomePage(),
  "onboarding": OnboardingScreen(),
};
