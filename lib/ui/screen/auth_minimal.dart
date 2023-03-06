import 'package:flutter/material.dart';

class MinimalAuth extends StatelessWidget {
  const MinimalAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Auth ._minimal")),
      body: Center(
        child: Column(
          children: [
            TextField(),
          ],
        ),
      ),
    );
  }
}
