import 'package:flutter/material.dart';

class SatvikFoodScreen extends StatelessWidget {
  const SatvikFoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E0B1F),
      appBar: AppBar(
        title: const Text('🥗 Satvik Food'),
        backgroundColor: Color(0xFF0E0B1F),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCard('🍋 Morning', 'Warm lemon water + soaked almonds.'),
          const SizedBox(height: 16),
          _buildCard('🥦 Lunch', 'Khichdi with ghee & seasonal sabji.'),
          const SizedBox(height: 16),
          _buildCard('🥛 Evening', 'Herbal tea + light seasonal fruit.'),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String content) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.orange.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orangeAccent)),
          const SizedBox(height: 8),
          Text(content, style: const TextStyle(fontSize: 15, color: Colors.white)),
        ],
      ),
    );
  }
}