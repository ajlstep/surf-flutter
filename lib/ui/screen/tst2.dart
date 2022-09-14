import 'package:flutter/material.dart';
import 'package:places/const/gradients.dart';
import 'package:places/mocks.dart';
import 'package:places/widgets/img/decoration_image.dart';

class TestPage2 extends StatelessWidget {
  const TestPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: TestBody2(),
    );
  }
}

class TestBody2 extends StatelessWidget {
  TestBody2({Key? key}) : super(key: key);
  final loc = mocksPredef[1];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView(
        scrollDirection: Axis.horizontal,
        // children: loc.imgURL
        //     .map((e) => AppImageConstructor(
        //           fit: BoxFit.cover,
        //           imgURL: e,
        //           opacity: 0.4,
        //           gradient: CGradients.whiteImageGradient,
        //         ).image())
        //     .toList(),
        // children: [
        //   AppImageConstructor(
        //     fit: BoxFit.cover,
        //     imgURL: loc.imgURL[0],
        //     opacity: 0.4,
        //     gradient: CGradients.whiteImageGradient,
        //   ).image(),
        //   AppImageConstructor(
        //     fit: BoxFit.cover,
        //     imgURL: loc.imgURL[1],
        //     opacity: 0.4,
        //     gradient: CGradients.whiteImageGradient,
        //   ).image(),
        //   AppImageConstructor(
        //     fit: BoxFit.cover,
        //     imgURL: loc.imgURL[2],
        //     opacity: 0.4,
        //     gradient: CGradients.whiteImageGradient,
        //   ).image(),
        // ],
        children: [
          Image.network(loc.imgURL[0], fit: BoxFit.fitHeight),
          Image.network(loc.imgURL[1], fit: BoxFit.fitHeight),
          Image.network(loc.imgURL[2], fit: BoxFit.fitHeight),
        ],
      ),
    );
  }
}
