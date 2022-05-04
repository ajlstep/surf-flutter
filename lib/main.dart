import 'package:flutter/material.dart';
// import 'ui/screen/sight_list_screen.dart' as screen;
import 'ui/screen/sight_list_screen.dart' as screen;
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
    );
  }
}

// class MyFirstWidget extends StatelessWidget {
//   int count = 0;
//   MyFirstWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     count++;
//     print("count $count"); // count 1
//     // build для StatelessWidget вызывается при открытий приложения
//     return const Center(
//       child: Text('Hello!'),
//     );
//   }
// }

// class MyFirstWidget2 extends StatefulWidget {
//   MyFirstWidget2({Key? key}) : super(key: key);

//   @override
//   State<MyFirstWidget2> createState() => _MyFirstWidget2State();
// }

// class _MyFirstWidget2State extends State<MyFirstWidget2> {
//   int count = 0;
//   @override
//   Widget build(BuildContext context) {
//     count++;
//     print("count $count"); // count 1, 2, 3...
//     // build для state StatefulWidget вызывается при каждой перерисовке
//     //Ответ на вопрос изменился? хз
//     return const Center(
//       child: Text('Hello!'),
//     );
//   }
// }
