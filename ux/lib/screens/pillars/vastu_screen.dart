import 'package:flutter/material.dart';

class VastuScreen extends StatelessWidget {
  const VastuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0B1F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E0B1F),
        title: const Text('🏠 Vastu Guidance'),
        centerTitle: true,
      ),
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
            purpose:
                'Encourages movement, communication; great for guest room or ventilation.',
            emoji: '💨',
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.lightGreen.shade200),
            ),
            child: const Text(
              '📌 Tip: Keep the center (Brahmasthan) of your home clutter-free to invite positivity.',
              style: TextStyle(fontSize: 15, color: Colors.white70),
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
        color: Colors.white12,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.green.shade200),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
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
                Text(direction,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold, color: Colors.orangeAccent)),
                const SizedBox(height: 4),
                Text(purpose, style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}