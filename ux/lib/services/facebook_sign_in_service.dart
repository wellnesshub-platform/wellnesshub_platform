import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import '../../constants/route_paths.dart';


// Future<void> loginWithFacebook(BuildContext context) async {
//   if (kIsWeb || Platform.isAndroid || Platform.isIOS) {
//     try {
//       final result = await FacebookAuth.instance.login();
//       if (result.status == LoginStatus.success) {
//         final accessToken = result.accessToken;
//         final userData = await FacebookAuth.instance.getUserData();
//         final credential = FacebookAuthProvider.credential(accessToken!.token);

//         final userCred =
//             await FirebaseAuth.instance.signInWithCredential(credential);
//         final user = userCred.user;

//         if (user != null) {
//           final doc = await FirebaseFirestore.instance
//               .collection('users')
//               .doc(user.uid)
//               .get();

//           if (!doc.exists) {
//             await FirebaseFirestore.instance
//                 .collection('users')
//                 .doc(user.uid)
//                 .set({
//               'email': user.email,
//               'name': user.displayName,
//               'createdAt': FieldValue.serverTimestamp(),
//             });
//             Navigator.pushReplacementNamed(context, RoutePaths.preferences);
//           } else {
//             Navigator.pushReplacementNamed(context, RoutePaths.home);
//           }
//         }
//       } else {
//         print("Facebook login failed: ${result.status}");
//       }
//     } catch (e) {
//       print("Facebook login error: $e");
//     }
//   } else {
//     print("Facebook login not supported on this platform");
//   }
// }


Future<void> loginWithFacebook(BuildContext context) async {
  // 👇 Dummy navigation to bypass Facebook login for demo
  Navigator.pushReplacementNamed(context, RoutePaths.home);
}
