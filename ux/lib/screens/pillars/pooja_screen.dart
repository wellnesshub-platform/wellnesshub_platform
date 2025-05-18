import 'package:flutter/material.dart';

class PoojaScreen extends StatelessWidget {
  const PoojaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B4513),
        title: const Text(
          'Daily Pooja & Rituals',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color(0xFFFFF8E1),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildPoojaCard(
            title: 'Morning Pooja',
            mantra: 'ॐ भूर्भुवः स्वः...',
            deity: 'Surya (Sun God)',
            emoji: '☀️',
          ),
          const SizedBox(height: 16),
          _buildPoojaCard(
            title: 'Evening Aarti',
            mantra: 'ॐ जय जगदीश हरे...',
            deity: 'Lakshmi & Vishnu',
            emoji: '🪔',
          ),
          const SizedBox(height: 16),
          _buildPoojaCard(
            title: 'Ganesh Vandana',
            mantra: 'ॐ गण गणपतये नमः',
            deity: 'Lord Ganesha',
            emoji: '🐘',
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              '🧘 Tip: Maintain sankalpa (intent) before pooja. You can set it through the AI assistant.',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPoojaCard({
    required String title,
    required String mantra,
    required String deity,
    required String emoji,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.yellow.shade100,
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
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Deity: $deity'),
                const SizedBox(height: 4),
                Text('Mantra: $mantra', style: const TextStyle(fontStyle: FontStyle.italic)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}