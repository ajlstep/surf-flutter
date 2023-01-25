// // import 'package:flutter_web_auth/flutter_web_auth.dart';
// import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

// // Future<void> signInWithGoogle() async {
// //   try {
// //     var result = await FlutterWebAuth.authenticate(
// //       url:
// //           'https://accounts.google.com/o/oauth2/auth?client_id=197123995466-fesg2fm6hmmsak12upnp8q0a4cj69jan.apps.googleusercontent.com&scope=openid+profile+email&redirect_uri=http://localhost:7878&response_type=token',
// //       callbackUrlScheme: 'my-callback-scheme',
// //     );
// //     print(result);
// //   } catch (e) {
// //     print(e);
// //   }
// // }

// Future<void> signInWithGoogle() async {
//   try {
//     var result = await FlutterWebAuth2.authenticate(
//       url:
//           'https://accounts.google.com/o/oauth2/auth?client_id=197123995466-fesg2fm6hmmsak12upnp8q0a4cj69jan.apps.googleusercontent.com&scope=openid+profile+email&redirect_uri=http://localhost:7878&response_type=token',
//       callbackUrlScheme: 'http://localhost:7878',
//     );
//     print(result);
//   } catch (e) {
//     print(e);
//   }
// }


// // final result = await FlutterWebAuth.authenticate(url: "https://my-custom-app.com/connect", callbackUrlScheme: "my-custom-app");

// // // Extract token from resulting url
// // final token = Uri.parse(result).queryParameters['token']