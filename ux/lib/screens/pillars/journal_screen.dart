import 'package:flutter/material.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B4513),
        title: const Text(
          'Journal & Reflection',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color(0xFFFFF8E1),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildJournalCard(
            title: '📝 Morning Reflection',
            prompt: 'What is one intention you want to set for today?',
          ),
          const SizedBox(height: 16),
          _buildJournalCard(
            title: '💭 Emotional Check-In',
            prompt: 'What emotions are you feeling right now? Name and accept them.',
          ),
          const SizedBox(height: 16),
          _buildJournalCard(
            title: '🌙 Evening Gratitude',
            prompt: 'List 3 things you are grateful for today.',
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              '🧘 Tip: Speak or type your thoughts. The AI will soon transcribe and analyze emotional patterns privately.',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJournalCard({
    required String title,
    required String prompt,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade100,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(prompt, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}