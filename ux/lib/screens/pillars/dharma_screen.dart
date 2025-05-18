import 'package:flutter/material.dart';

class DharmaScreen extends StatelessWidget {
  const DharmaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B4513),
        title: const Text(
          'Dharma Feed',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color(0xFFFFF8E1),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildDharmaPost(
            source: 'Bhagavad Gita 2.47',
            quote: 'You have the right to perform your prescribed duty, but not to the results of your actions.',
            emoji: '📜',
          ),
          const SizedBox(height: 16),
          _buildDharmaPost(
            source: 'Upanishads – Katha 2.2.13',
            quote: 'When all desires vanish from the heart, the mortal becomes immortal and attains Brahman.',
            emoji: '🕉️',
          ),
          const SizedBox(height: 16),
          _buildDharmaPost(
            source: 'Temple Insight',
            quote: 'Today is Ekadashi – a powerful day for fasting, silence, and remembrance of Vishnu.',
            emoji: '🙏',
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              '🧘 Tip: Check back daily for Dharma wisdom curated by our AI from scriptures and saints.',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDharmaPost({
    required String source,
    required String quote,
    required String emoji,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.brown.shade100,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 26)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(source, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 6),
                Text(quote, style: const TextStyle(fontSize: 15)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}