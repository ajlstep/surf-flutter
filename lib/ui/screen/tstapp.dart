// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/screen/auth_minimal.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/screen/onboarding_screen.dart';
import 'package:places/ui/screen/reg_minimal.dart';
import 'package:places/ui/screen/settings_screen.dart';
import 'package:places/ui/screen/sigh_list_sliver.dart';
import 'package:places/ui/screen/sigh_list_sliver2.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/spalsh_screen.dart';
import 'package:places/ui/screen/tst.dart';
import 'package:places/ui/screen/tst2.dart';
import 'package:places/ui/screen/tst3.dart';
import 'package:places/ui/screen/tst4.dart';
import 'package:places/ui/screen/visiting_screen.dart';
import 'package:places/mocks.dart';
// import 'package:places/utils/auth_reg/google_auth/google.dart';
// import 'package:places/utils/auth_reg/google_auth/google2.dart';
// import 'package:places/utils/auth_reg/google_auth/google3.dart';
// import 'package:places/utils/auth_reg/google_auth/google4.dart';

class TestPages extends StatelessWidget {
  const TestPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("test app"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // list.forEach((key, value) {  })
            for (var el in list.entries) getWidg(el.key, el.value, context)
          ],
        ),
      ),
    );
  }

  Widget getWidg(String name, Widget widg, BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => widg),
        );
      },
      child: Text(name),
    );
  }
}

var list = {
  "sight list": const SightListScreen(),
  "sight list sliver": const SightListScreenSliver(),
  "sight list sliver 2": const SightListScreenSliver2(),
  "visit list": VisitingScreen(visitList: VisitList),
  "filter screen": const FiltersScreen(),
  "settings page": const SettingsPage(),
  "test page1": const TestPAge(),
  "test page2": const TestPage2(),
  "test page3": MyHomePage(),
  "onboarding": OnboardingScreen(),
  "test page4": const TestPage5(),
  "spash screen": const SplashScreen(),
  "reg": MinimalRegistration(),
  "auth": MinimalAuth(),
  // "auth page": const AuthPage(),
};

// class AuthPage extends StatefulWidget {
//   const AuthPage({Key? key}) : super(key: key);

//   @override
//   State<AuthPage> createState() => _AuthPageState();
// }

// class _AuthPageState extends State<AuthPage> {
//   // late FirebaseApp firebaseApp;
//   late FirebaseAuth fireAuth;

//   @override
//   void initState() {
//     super.initState();
//     asInit();
//   }

//   Future<void> asInit() async {
//     // firebaseApp = await Firebase.initializeApp();
//     // fireAuth = FirebaseAuth.instance;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             TextButton(
//               onPressed: () async {
//                 await signInWithGoogle2();
//               },
//               child: const Text("auth"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
