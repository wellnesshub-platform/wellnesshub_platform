import 'package:flutter/material.dart';

class MusicRagaScreen extends StatelessWidget {
  const MusicRagaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B4513),
        title: const Text(
          'Music & Raga',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color(0xFFFFF8E1),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMusicCard(
            raga: 'Raga Yaman',
            time: 'Evening',
            effect: 'Uplifts mood, calms nerves',
            emoji: '🎶',
          ),
          const SizedBox(height: 16),
          _buildMusicCard(
            raga: 'Raga Bhairav',
            time: 'Morning',
            effect: 'Grounding, enhances clarity',
            emoji: '🌅',
          ),
          const SizedBox(height: 16),
          _buildMusicCard(
            raga: 'Raga Durga',
            time: 'Night',
            effect: 'Eases stress, peaceful sleep',
            emoji: '🌙',
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              '🎧 Tip: Listen to bhajans or instrumental ragas tuned to your current emotion or dosha imbalance for better resonance.',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMusicCard({
    required String raga,
    required String time,
    required String effect,
    required String emoji,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.shade100,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 28)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(raga, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('Time: $time'),
                Text('Effect: $effect'),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.play_circle_fill, color: Colors.brown),
            onPressed: () {
              // TODO: Hook up audio player
            },
          )
        ],
      ),
    );
  }
}