import 'package:flutter/material.dart';
import 'package:places/providers/filterprovider.dart';
import 'package:places/providers/themeprovide.dart';
import 'package:places/ui/screen/settings_screen.dart' as screen5;
import 'package:places/ui/screen/sight_list_screen.dart' as screen;
import 'package:places/ui/screen/sight_detailed.dart' as screen2;
import 'package:places/ui/screen/visiting_screen.dart' as screen3;
import 'package:places/ui/screen/filters_screen.dart' as screen4;
import 'package:places/mocks.dart';
import 'package:provider/provider.dart';

import 'ui/res/themes.dart';
// import 'ui/screen/sight_list_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Filters()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '4. Введите текст вопроса',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: context.watch<ThemeProvider>().themeMode,
      // theme: ThemeData(
      //   primarySwatch: Colors.indigo,
      //   colorScheme: const ColorScheme.light(),
      // ),
      // home: const screen.SightListScreen(),
      // home: const screen2.DetailedPlace(),
      home: screen3.VisitingScreen(visitList: VisitList),
      // home: const screen4.FiltersScreen(),
      // home: const screen5.SettingsPage(),
    );
  }
}
