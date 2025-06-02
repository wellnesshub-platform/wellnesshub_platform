// lib/splash_screen.dart
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkUserAndNavigate();
  }

  void _checkUserAndNavigate() {
    // Make sure you are not already signed out from a previous session
    // during testing.
    // For testing, you might want to force sign out here:
    // FirebaseAuth.instance.signOut(); // UNCOMMENT FOR TESTING IF NEEDED

    Timer(const Duration(seconds: 3), () {
      User? user = FirebaseAuth.instance.currentUser;

      // Print to console to see what's happening
      print("Splash Screen: Current user is ${user?.uid}");

      if (mounted) { // Check if the widget is still in the tree
        if (user != null) {
          print("Splash Screen: User found, navigating to /home");
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          print("Splash Screen: No user found, navigating to /login");
          Navigator.pushReplacementNamed(context, '/login');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5), // Consistent background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/splash_logo.png', // Ensure this path is correct
              width: 200,
              errorBuilder: (context, error, stackTrace) {
                print("Error loading splash_logo.png: $error");
                return const Icon(Icons.spa, size: 100, color: Colors.purple);
              },
            ),
            const SizedBox(height: 30),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.purple[700]!),
            ),
          ],
        ),
      ),
    );
  }
}