import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_list_screen.dart' as screen;
import 'package:places/ui/screen/sight_detailed.dart' as screen2;
import 'package:places/ui/screen/visiting_screen.dart' as screen3;
import 'package:places/mocks.dart';

import 'ui/res/themes.dart';
// import 'ui/screen/sight_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '4. Введите текст вопроса',
      theme: lightTheme,
      // theme: ThemeData(
      //   primarySwatch: Colors.indigo,
      //   colorScheme: const ColorScheme.light(),
      // ),
      // home: const screen.SightListScreen(),
      // home: const screen2.DetailedPlace(),
      home: screen3.VisitingScreen(visitList: VisitList),
    );
  }
}
