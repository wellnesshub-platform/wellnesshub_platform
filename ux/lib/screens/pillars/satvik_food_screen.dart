import 'package:flutter/material.dart';

class SatvikFoodScreen extends StatelessWidget {
  const SatvikFoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B4513),
        title: const Text(
          'Satvik Food Guide',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color(0xFFFFF8E1),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            '🌿 Seasonal Food Suggestions',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildFoodCard(
            title: 'Spring (Kapha)',
            foods: 'Ginger tea, steamed broccoli, bitter greens, turmeric milk',
            icon: '🌱',
          ),
          const SizedBox(height: 12),
          _buildFoodCard(
            title: 'Summer (Pitta)',
            foods: 'Coconut water, cucumber, melons, mint chutney',
            icon: '🍃',
          ),
          const SizedBox(height: 12),
          _buildFoodCard(
            title: 'Winter (Vata)',
            foods: 'Warm soups, ghee, root vegetables, sesame oil',
            icon: '❄️',
          ),
          const SizedBox(height: 24),
          const Text(
            '🧘 Ayurvedic Note:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.lightBlue.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              'Always eat fresh, warm, and seasonal foods. Avoid processed, overly spicy, or stale meals for maintaining a satvik lifestyle.',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodCard({required String title, required String foods, required String icon}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(icon, style: const TextStyle(fontSize: 24)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              '$title\n$foods',
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}