import 'package:flutter/material.dart';

class MindScreen extends StatelessWidget {
  const MindScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B4513),
        title: const Text(
          'Mind',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color(0xFFFFF8E1),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildCard(
            icon: Icons.self_improvement,
            title: 'Mood Meditation',
            subtitle: '5-min guided practice for emotional balance',
          ),
          const SizedBox(height: 16),
          _buildCard(
            icon: Icons.psychology,
            title: 'Affirmation of the Day',
            subtitle: '"I am calm, capable, and in control."',
          ),
          const SizedBox(height: 16),
          _buildCard(
            icon: Icons.monitor_heart,
            title: 'Biofeedback Journal',
            subtitle: 'Track your mental clarity with HRV',
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.deepOrange.shade100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              '🧠 AI Tip: Based on your sleep and stress, a 10-min breath meditation is recommended today.',
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCard({required IconData icon, required String title, required String subtitle}) {
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
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
        onTap: () {},
      ),
    );
  }
}