import 'package:flutter/material.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0B1F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E0B1F),
        title: const Text('📓 Journal & Reflection'),
        centerTitle: true,
      ),
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
              color: Colors.white10,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.orange.shade300),
            ),
            child: const Text(
              '🧘 Tip: Speak or type your thoughts. AI will transcribe & analyze emotion patterns privately.',
              style: TextStyle(fontSize: 15, color: Colors.white70),
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
        color: Colors.white12,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.orange.shade100),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 17, fontWeight: FontWeight.bold, color: Colors.orangeAccent)),
          const SizedBox(height: 8),
          Text(prompt, style: const TextStyle(fontSize: 15, color: Colors.white)),
        ],
      ),
    );
  }
}