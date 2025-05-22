import 'package:flutter/material.dart';

class DailyScreen extends StatelessWidget {
  final List<Map<String, dynamic>>? planOverride;

  const DailyScreen({super.key, this.planOverride});

  @override
  Widget build(BuildContext context) {
    final groupedPlan = {
      '🧠 Mind': [
        {'time': '08:00 AM', 'activity': 'Gratitude Journal'},
        {'time': '08:15 AM', 'activity': 'Positive Affirmation'},
      ],
      '🎶 Music & Raga': [
        {'time': '09:00 AM', 'activity': 'Shiv Bhajan'},
        {'time': '09:15 AM', 'activity': 'Krishna Bhajan'},
      ],
      '📿 Spirituality': [
        {'time': '09:30 AM', 'activity': 'Gita Verse Recitation'},
      ],
      '🍲 Satvik Food': [
        {'time': '10:00 AM', 'activity': 'Lemon Water + Fruits'},
        {'time': '10:30 AM', 'activity': 'Warm Khichdi'},
      ],
      '🌿 Ayurveda': [
        {'time': '11:00 AM', 'activity': 'Vata-Pacifying Tea'},
        {'time': '11:30 AM', 'activity': 'Herbal Supplement'},
      ],
      '🪔 Pooja': [
        {'time': '12:00 PM', 'activity': 'Shiv Abhishek'},
        {'time': '12:15 PM', 'activity': 'Gayatri Mantra Chant'},
      ],
    };

    return Scaffold(
      backgroundColor: const Color(0xFF0E0B1F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E0B1F),
        title: const Text("Your Daily Wellness Plan"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: groupedPlan.entries.map((entry) {
            final emoji = entry.key.substring(0, 2);
            final title = entry.key.substring(3);

            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.key,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...entry.value.map((item) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.orange.shade100,
                            radius: 22,
                            child: Text(emoji, style: const TextStyle(fontSize: 18)),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['time'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF5E2600),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  item['activity'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                    height: 1.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList()
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}