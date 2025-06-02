import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'auth_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();

    void handleSignInResult(bool success) {
      if (success) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sign-in failed. Please try again.')),
        );
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/splash_logo.png', height: 120,
                 errorBuilder: (context, error, stackTrace) {
                   return const Icon(Icons.spa, size: 80, color: Colors.purple);
                 },
              ),
              const SizedBox(height: 20),
              const Text('Welcome to Wellness Hub',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                  textAlign: TextAlign.center),
              const SizedBox(height: 10),
              Text('Your Personalized Mind-Body-Spirit Companion',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  textAlign: TextAlign.center),
              const SizedBox(height: 50),
              ElevatedButton.icon(
                icon: const FaIcon(FontAwesomeIcons.google, color: Colors.white),
                label: const Text('Sign in with Google'),
                onPressed: () async => handleSignInResult(
                    (await authService.signInWithGoogle()) != null),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.redAccent,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
                label: const Text('Sign in with Facebook'),
                onPressed: () async => handleSignInResult(
                    (await authService.signInWithFacebook()) != null),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue[800],
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
              ),
              const SizedBox(height: 30),
              TextButton(
                child: Text('Login as Guest',
                    style: TextStyle(color: Colors.purple[700], fontSize: 16)),
                onPressed: () async =>
                    handleSignInResult((await authService.signInAsGuest()) != null),
              ),
            ],
          ),
        ),
      ),
    );
  }
}