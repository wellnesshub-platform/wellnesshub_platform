import 'package:flutter/material.dart';

class MindScreen extends StatelessWidget {
  const MindScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E0B1F),
      appBar: AppBar(
        title: const Text('🧠 Mind Support'),
        backgroundColor: Color(0xFF0E0B1F),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCard('🧘‍♀️ Breath Focus', 'Do a 3-minute mindful breathing exercise.'),
          const SizedBox(height: 16),
          _buildCard('💡 Affirmation', 'Repeat: "I am calm, focused, and grounded."'),
          const SizedBox(height: 16),
          _buildCard('📓 Journal Prompt', 'What thought can you let go of today?'),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String content) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.orange.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orangeAccent)),
          const SizedBox(height: 8),
          Text(content, style: const TextStyle(fontSize: 15, color: Colors.white)),
        ],
      ),
    );
  }
}