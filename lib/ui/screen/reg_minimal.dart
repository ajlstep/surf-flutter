import 'package:flutter/material.dart';

class MinimalRegistration extends StatelessWidget {
  MinimalRegistration({Key? key}) : super(key: key);
  final TextEditingController _nick = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registration ._minimal")),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _nick,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
