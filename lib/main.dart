import 'package:flutter/material.dart';
import 'ui/screen/sight_list_screen.dart' as screen;
import 'ui/screen/sight_detailed.dart' as screen2;
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
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        colorScheme: const ColorScheme.light(),
      ),
      home: const screen.SightListScreen(),
      // home: const screen2.DetailedPlace(),
    );
  }
}
