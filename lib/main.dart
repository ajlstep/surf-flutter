// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:places/providers/filterprovider.dart';
import 'package:places/providers/themeprovide.dart';
import 'package:places/ui/screen/settings_screen.dart';
import 'package:places/ui/screen/sigh_list_sliver2.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/visiting_screen.dart';
import 'package:provider/provider.dart';

import 'package:places/ui/res/themes.dart';

import 'ui/screen/tstapp.dart';
// import 'ui/screen/sight_list_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: const FirebaseOptions(
  //     apiKey: 'AIzaSyBoDJHhlqdxCWfDG6qxIbt5AG-6uzv2ru8',
  //     appId: '1:444362306321:android:70d542f45b843a3e1c52b0',
  //     messagingSenderId: '444362306321',
  //     projectId: 'places2-test',
  //     storageBucket: 'places2-test.appspot.com',
  //   ),
  // );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Filters()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        // ChangeNotifierProvider(create: (context) => AppBarButtonProvider()),
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
      routes: {
        "/": (context) => const TestPages(),
        "/list": (context) => const SightListScreenSliver2(),
        "/visiting": (context) => VisitingScreen(visitList: VisitList),
        "/settings": (context) => const SettingsPage(),
      },
      // theme: ThemeData(
      //   primarySwatch: Colors.indigo,
      //   colorScheme: const ColorScheme.light(),
      // ),
      // home: const screen.SightListScreen(),
      // home: const screen2.DetailedPlace(),
      // home: screen3.VisitingScreen(visitList: VisitList),
      // home: const screen4.FiltersScreen(),
      // home: const screen5.SettingsPage(),
      // home: const AddSightScreen(),
      // home: const SightSearchScreen(),
      // home: const TestPAge(),
      // home: const TestPage2(),
      // home: const OnboardingScreen(),
      // home: MyHomePage(),
      // home: const SplashScreen(),
      initialRoute: "/",
    );
  }
}
