import 'package:flutter/material.dart';

class RemindersScreen extends StatelessWidget {
  const RemindersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B4513),
        title: const Text(
          'Reminders & Alerts',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color(0xFFFFF8E1),
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
              color: Colors.lightBlue.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              '📅 Tip: Use voice or touch to schedule reminders for mantra chanting, fasting days, or journaling moments.',
              style: TextStyle(fontSize: 16),
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
        color: Colors.teal.shade100,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 3)),
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
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 4),
                Text('⏰ $time'),
                Text(note),
              ],
            ),
          ),
        ],
      ),
    );
  }
}