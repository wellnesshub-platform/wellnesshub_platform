import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_service.dart';
import 'utils.dart'; // Import utils for shadows

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final AuthService authService = AuthService();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
             decoration: BoxDecoration(
               color: const Color(0xFFF3E5F5),
               shape: BoxShape.circle,
               boxShadow: [
                 BoxShadow(color: Colors.purple.withOpacity(0.20), offset: const Offset(5, 5), blurRadius: 10),
                 BoxShadow(color: Colors.white.withOpacity(0.8), offset: const Offset(-5, -5), blurRadius: 10),
               ],
             ),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: user?.photoURL != null
                  ? NetworkImage(user!.photoURL!)
                  : null,
              child: user?.photoURL == null
                  ? const Icon(Icons.person, size: 50, shadows: iconShadows,)
                  : null,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            user?.displayName ?? user?.email ?? 'Guest User',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          ElevatedButton.icon(
             icon: const Icon(Icons.logout, color: Colors.white, shadows: iconShadows,),
             label: const Text('Sign Out', style: TextStyle(color: Colors.white)),
             onPressed: () async {
                await authService.signOut();
                Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
             },
             style: ElevatedButton.styleFrom(
               backgroundColor: Colors.redAccent,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 8,
              ),
           )
        ],
      ),
    );
  }
}