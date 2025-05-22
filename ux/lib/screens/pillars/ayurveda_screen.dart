import 'package:flutter/material.dart';

class AyurvedaScreen extends StatelessWidget {
  const AyurvedaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0B1F),
      appBar: AppBar(
        title: const Text('🌿 Ayurveda'),
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
              'Coming soon: Personalized 🌿 Ayurveda insights, tools, and daily guidance.',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}