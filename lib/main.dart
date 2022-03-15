import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyFirstWidget(),
    );
  }
}

class MyFirstWidget extends StatelessWidget {
  int count = 0;
  MyFirstWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    count++;
    print("count $count"); // count 1
    // build для StatelessWidget вызывается при открытий приложения
    return const Center(
      child: Text('Hello!'),
    );
  }
}
