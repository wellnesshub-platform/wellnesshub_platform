import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0B1F),
      appBar: AppBar(
        title: const Text("Your Profile"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 48,
                  backgroundImage: AssetImage('assets/avatar_placeholder.png'),
                ),
                SizedBox(height: 12),
                Text(
                  'Guest User',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text('wellnesshub@example.com', style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          const SizedBox(height: 30),
          _ProfileItem(icon: Icons.settings, label: "Settings"),
          _ProfileItem(icon: Icons.privacy_tip, label: "Privacy Policy"),
          _ProfileItem(icon: Icons.feedback, label: "Feedback"),
          _ProfileItem(icon: Icons.logout, label: "Logout", isLogout: true),
        ],
      ),
    );
  }
}

class _ProfileItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isLogout;

  const _ProfileItem({
    required this.icon,
    required this.label,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white10,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: isLogout ? Colors.redAccent : Colors.orange),
        title: Text(label, style: const TextStyle(color: Colors.white)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 16),
        onTap: () {
          if (isLogout) {
            Navigator.pushReplacementNamed(context, '/login');
          }
        },
      ),
    );
  }
}