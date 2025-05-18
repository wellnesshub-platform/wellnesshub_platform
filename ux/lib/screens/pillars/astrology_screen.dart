import 'package:flutter/material.dart';

class AstrologyScreen extends StatelessWidget {
  const AstrologyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B4513),
        title: const Text(
          'Astrology Insights',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color(0xFFFFF8E1),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildAstroCard(
            emoji: '🌕',
            title: 'Today\'s Moon Sign',
            description: 'Chandra is in Vrishabha (Taurus), favoring stability and grounded decisions.',
          ),
          const SizedBox(height: 16),
          _buildAstroCard(
            emoji: '🔭',
            title: 'Transit Alert',
            description: 'Mercury enters Gemini — communication, learning, and clarity are boosted.',
          ),
          const SizedBox(height: 16),
          _buildAstroCard(
            emoji: '🧘‍♂️',
            title: 'Ritual Suggestion',
            description: 'Perform a short mantra japa for Budh (Mercury) to enhance intellect today.',
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.indigo.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              '✨ Pro Tip: Align your daily actions with your nakshatra for greater spiritual flow. Coming soon: AI-based chart sync.',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAstroCard({
    required String emoji,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade100,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 4)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 28)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}