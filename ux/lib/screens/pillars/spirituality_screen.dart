import 'package:flutter/material.dart';

class SpiritualityScreen extends StatelessWidget {
  const SpiritualityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B4513),
        title: const Text(
          'Spirituality',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color(0xFFFFF8E1),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            '🕉️ Gita Wisdom of the Day',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              '"You have a right to perform your prescribed duties, but you are not entitled to the fruits of your actions." \n— Bhagavad Gita 2.47',
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '🙏 Seva Opportunity',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              'Support a local community kitchen by donating or volunteering 1 hour this week.',
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '📿 Daily Mantra',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.purple.shade100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              '“Om Namah Shivaya” — Chant this 21 times with focused breath for inner peace.',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}