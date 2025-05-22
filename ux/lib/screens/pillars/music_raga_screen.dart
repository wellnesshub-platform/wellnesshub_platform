import 'package:flutter/material.dart';

class MusicRagaScreen extends StatelessWidget {
  const MusicRagaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E0B1F),
      appBar: AppBar(
        title: const Text('🎵 Music & Raga'),
        backgroundColor: Color(0xFF0E0B1F),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCard('🎶 Raga Bhairav', 'Play morning raga to start your day.'),
          const SizedBox(height: 16),
          _buildCard('🕉️ Om Chant', 'Play 108 Om chants to balance chakras.'),
          const SizedBox(height: 16),
          _buildCard('🎧 Bhakti Bhajans', 'Listen to devotional Krishna or Shiva bhajans.'),
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