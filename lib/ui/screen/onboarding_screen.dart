import 'package:flutter/material.dart';
import 'package:places/const/icons.dart';
import 'package:places/providers/buttonappbarprovider.dart';
import 'package:places/widgets/appbar/appbar.dart';
import 'package:places/widgets/button/buttons.dart';
import 'package:places/widgets/pagesbodywidgets/empty_body.dart';
import 'package:places/widgets/tabindicator/customcircularindicator.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarOnBoarding(
        skipTap: () {
          Navigator.pop(context);
        },
      ),
      body: const OnBoardingBody(),
    );
  }
}

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({Key? key}) : super(key: key);

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  final PageController _pageController = PageController();
  late Widget _cursorIndicator;
  final CustomCircularIndicatorController _controller =
      CustomCircularIndicatorController();

  @override
  void initState() {
    super.initState();
    _cursorIndicator = CustomCircularIndicator(
      focusColor: Colors.green,
      unFocusColor: Colors.grey,
      radius: 8,
      space: 8,
      tabLen: 3,
      width: 24,
      controller: _controller,
    );
    final themeProvider = context.read<AppBarButtonProvider>();
    _pageController.addListener(() {
      var pageNow = _pageController.page!.round();
      if (pageNow == 2) {
        themeProvider.setInvisible();
      } else {
        themeProvider.setVisible();
      }
      _controller.animateTo(pageNow);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          child: _cursorIndicator,
          alignment: const Alignment(0, 0.75),
        ),
        PageView(
          controller: _pageController,
          children: [
            const StartBody(
              icon: AppIcons.tutorialWayIndicator,
              titleText: "Добро пожаловать\nв Путеводитель",
              text: "Ищи новые локации и сохраняй\n самые любимые.",
            ),
            const StartBody(
              icon: AppIcons.tutorialTravelBag,
              titleText: "Построй маршрут\nи отправляйся в путь",
              text: "Достигай цели максимально\nбыстро и комфортно.",
            ),
            StartBody(
              icon: AppIcons.tutorialAdd,
              titleText: "Добавляй места,\nкоторые нашёл сам",
              text: "Делись самыми интересными\nи помоги нам стать лучше!",
              // button: TextButton(
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              //   child: const Text("Начать"),
              // ),
              button: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 48,
                  maxWidth: 328,
                ),
                child: ButtonConstructor(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                  text: Text("НА СТАРТ"),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// class OnBoardingBodyAnimated extends StatefulWidget {
//   const OnBoardingBodyAnimated({Key? key}) : super(key: key);

//   @override
//   _OnBoardingBodyAnimatedState createState() => _OnBoardingBodyAnimatedState();
// }

// class _OnBoardingBodyAnimatedState extends State<OnBoardingBodyAnimated> {
//   final PageController _pageController = PageController();
//   late Widget _cursorIndicator;
//   final CustomCircularIndicatorController _controller =
//       CustomCircularIndicatorController();

//   @override
//   void initState() {
//     super.initState();
//     _cursorIndicator = CustomCircularIndicator(
//       focusColor: Colors.green,
//       unFocusColor: Colors.grey,
//       radius: 8,
//       space: 8,
//       tabLen: 3,
//       width: 24,
//       controller: _controller,
//     );
//     _pageController.addListener(() {
//       _controller.animateTo(_pageController.page!.round());
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned(
//           child: Center(
//             child: _cursorIndicator,
//           ),
//           top: 50,
//           left: 50,
//         ),
//         PageView(
//           controller: _pageController,
//           children: const [
//             Center(
//               child: Text("1"),
//             ),
//             Center(
//               child: Text("2"),
//             ),
//             Center(
//               child: Text("3"),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

