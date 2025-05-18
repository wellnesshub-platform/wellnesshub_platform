import 'package:flutter/material.dart';

class BodyScreen extends StatelessWidget {
  const BodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B4513),
        title: const Text(
          'Body',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color(0xFFFFF8E1),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCard(
            icon: Icons.self_improvement,
            title: 'Daily Yoga Flow',
            subtitle: '15-min beginner sequence',
            actionText: 'Start',
          ),
          const SizedBox(height: 16),
          _buildCard(
            icon: Icons.air,
            title: 'Box Breathing',
            subtitle: '4-4-4-4 guided breath practice',
            actionText: 'Try Now',
          ),
          const SizedBox(height: 16),
          _buildCard(
            icon: Icons.accessibility_new,
            title: 'Quick Stretch',
            subtitle: '2-min chair movement',
            actionText: 'Do',
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              '💡 Tip: Based on your energy today, we recommend a cobra pose to support your lower back.',
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String actionText,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: ListTile(
        leading: Icon(icon, size: 32, color: Colors.brown),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Text(actionText, style: const TextStyle(color: Colors.deepOrange)),
        onTap: () {},
      ),
    );
  }
}