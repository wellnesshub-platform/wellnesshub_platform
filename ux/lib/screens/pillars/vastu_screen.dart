import 'package:flutter/material.dart';

class VastuScreen extends StatelessWidget {
  const VastuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B4513),
        title: const Text(
          'Vastu Guidance',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color(0xFFFFF8E1),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildVastuCard(
            direction: 'North-East',
            purpose: 'Ideal for meditation, pooja room, spiritual zone.',
            emoji: '🧘',
          ),
          const SizedBox(height: 16),
          _buildVastuCard(
            direction: 'South-West',
            purpose: 'Best for master bedroom, stability, and grounding.',
            emoji: '🛏️',
          ),
          const SizedBox(height: 16),
          _buildVastuCard(
            direction: 'North-West',
            purpose: 'Encourages movement, communication; suitable for guest room or air ventilation.',
            emoji: '💨',
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.lightGreen.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              '📌 Tip: Keep the center (Brahmasthan) of your home clean and clutter-free to invite positivity.',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVastuCard({
    required String direction,
    required String purpose,
    required String emoji,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 3)),
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
                Text(direction, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(purpose),
              ],
            ),
          ),
        ],
      ),
    );
  }
}