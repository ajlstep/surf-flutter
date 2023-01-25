// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class AuthenticationInGoogle {
//   static Future<User?> signInWithGoogle(
//       {required BuildContext context, required FirebaseAuth auth}) async {
//     // late FirebaseAuth auth;
//     User? user;

//     final GoogleSignIn googleSignIn = GoogleSignIn();

//     final GoogleSignInAccount? googleSignInAccount =
//         await googleSignIn.signIn();

//     if (googleSignInAccount != null) {
//       final GoogleSignInAuthentication googleSignInAuthentication =
//           await googleSignInAccount.authentication;

//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken,
//       );

//       try {
//         final UserCredential userCredential =
//             await auth.signInWithCredential(credential);
//         print(userCredential);
//         user = userCredential.user;
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'account-exists-with-different-credential') {
//           print(e);
//           // handle the error here
//         } else if (e.code == 'invalid-credential') {
//           print(e);
//         }
//       } catch (e) {
//         print(e);
//       }
//     }

//     return user;
//   }
// }
