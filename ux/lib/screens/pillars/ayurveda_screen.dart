import 'package:flutter/material.dart';

class AyurvedaScreen extends StatelessWidget {
  const AyurvedaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B4513),
        title: const Text(
          'Ayurveda & Doshas',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color(0xFFFFF8E1),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            '🌿 Know Your Dosha',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildDoshaCard('Vata', 'Warm, cooked foods help balance cold, dry Vata. Avoid raw salads and cold drinks.', Colors.green.shade100),
          const SizedBox(height: 12),
          _buildDoshaCard('Pitta', 'Cool, refreshing foods like cucumber and melons help. Avoid spicy or oily food.', Colors.pink.shade100),
          const SizedBox(height: 12),
          _buildDoshaCard('Kapha', 'Light, dry, and warming foods work well. Favor bitter greens and spices like ginger.', Colors.blue.shade100),
          const SizedBox(height: 24),
          const Text(
            '🧘 Seasonal Tip',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              'This is a Kapha season (Spring). Favor warm teas, lighter meals, and early rising.',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoshaCard(String title, String description, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.brown,
            child: Text(title[0]),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              '$title\n$description',
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}