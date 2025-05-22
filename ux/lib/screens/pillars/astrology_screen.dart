import 'package:flutter/material.dart';

class AstrologyScreen extends StatelessWidget {
  const AstrologyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0B1F),
      appBar: AppBar(
        title: const Text('🔯 Astrology'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              'Coming soon: Personalized 🔯 Astrology guidance, tools, and rituals.',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}