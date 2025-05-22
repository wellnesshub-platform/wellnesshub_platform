// lib/screens/ai/ai_bot_screen.dart
import 'package:flutter/material.dart';

class AiBotScreen extends StatelessWidget {
  const AiBotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0B1F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E0B1F),
        title: const Text('🤖 AI Assistant'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Ask your AI Assistant...',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}