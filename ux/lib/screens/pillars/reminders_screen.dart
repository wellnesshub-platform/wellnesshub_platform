import 'package:flutter/material.dart';

class RemindersScreen extends StatelessWidget {
  const RemindersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0B1F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E0B1F),
        title: const Text('⏰ Reminders & Alerts'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildReminderCard(
            emoji: '🕉️',
            title: 'Morning Meditation',
            time: '6:00 AM',
            note: 'Start your day with 5 minutes of breath awareness.',
          ),
          const SizedBox(height: 16),
          _buildReminderCard(
            emoji: '🍵',
            title: 'Ayurvedic Tea Time',
            time: '3:30 PM',
            note: 'Sip on tulsi-ginger tea to restore Vata-Pitta balance.',
          ),
          const SizedBox(height: 16),
          _buildReminderCard(
            emoji: '🪔',
            title: 'Evening Pooja Alert',
            time: '7:00 PM',
            note: 'Light your diya and offer gratitude to the divine.',
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.orange.shade300),
            ),
            child: const Text(
              '📅 Tip: Use voice or touch to schedule reminders for chanting, fasting, or journaling.',
              style: TextStyle(fontSize: 15, color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReminderCard({
    required String emoji,
    required String title,
    required String time,
    required String note,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.orange.shade100),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
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
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16, color: Colors.orangeAccent)),
                const SizedBox(height: 4),
                Text('⏰ $time', style: const TextStyle(color: Colors.white70)),
                Text(note, style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}