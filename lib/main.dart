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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // The GlobalKey will allow us to access the Scaffold's State
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // We add the key to the Scaffold so we can access it later
      key: _key,
      body: Center(
        child: MaterialButton(
          child: const Text(
            "SnackBar",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.red,
          // We now can access the currentState via the GlobalKey
          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
            BottomSnackbar("Oh! You clicked me!"),
          ),
        ),
      ),
    );
  }
}

class BottomSnackbar extends SnackBar {
  final String text;

  BottomSnackbar(String text)
      : text = text,
        super(content: Text(text));

  @override
  SnackBar build(BuildContext context) {
    return this;
  }
}

//new branch
