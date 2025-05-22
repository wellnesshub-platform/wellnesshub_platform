import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import '../../constants/route_paths.dart';


// class GoogleSignInService {
//   static final FirebaseAuth _auth = FirebaseAuth.instance;
//   static final FirebaseFirestore _db = FirebaseFirestore.instance;

//   static Future<void> signInWithGoogle(BuildContext context) async {
//     try {
//       final googleUser = await GoogleSignIn().signIn();
//       if (googleUser == null) return;

//       final googleAuth = await googleUser.authentication;
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       final userCred = await _auth.signInWithCredential(credential);
//       final user = userCred.user;

//       if (user != null) {
//         final doc = await _db.collection('users').doc(user.uid).get();
//         if (!doc.exists) {
//           await _db.collection('users').doc(user.uid).set({
//             'email': user.email,
//             'name': user.displayName,
//             'createdAt': FieldValue.serverTimestamp(),
//           });
//           Navigator.pushReplacementNamed(context, RoutePaths.preferences);
//         } else {
//           Navigator.pushReplacementNamed(context, RoutePaths.home);
//         }
//       }
//     } catch (e) {
//       print('Google sign-in error: $e');
//     }
//   }
// }

class GoogleSignInService {
  static Future<void> signInWithGoogle(BuildContext context) async {
    // 👇 Dummy navigation to bypass Firebase for demo
    Navigator.pushReplacementNamed(context, RoutePaths.home);
  }
}
