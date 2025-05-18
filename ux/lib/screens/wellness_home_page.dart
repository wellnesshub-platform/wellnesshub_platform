import 'package:flutter/material.dart';
import 'pillar_page.dart';

class WellnessHomePage extends StatelessWidget {
  final List<Map<String, dynamic>> features = const [
    {'name': 'Mind', 'subtitle': 'Meditations & AH.', 'icon': Icons.psychology},
    {'name': 'Body', 'subtitle': 'Yoga & Breathwork', 'icon': Icons.self_improvement},
    {'name': 'Spirituality', 'subtitle': 'Gita Wisdom & Seva', 'icon': Icons.emoji_objects},
    {'name': 'Ayurveda', 'subtitle': 'Dosha & Herbs', 'icon': Icons.spa},
    {'name': 'Satvik Food', 'subtitle': 'Clean Food', 'icon': Icons.restaurant},
    {'name': 'Music & Raga', 'subtitle': 'Sound Healing', 'icon': Icons.music_note},
    {'name': 'Pooja', 'subtitle': 'Daily Rituals', 'icon': Icons.auto_awesome},
    {'name': 'Astrology', 'subtitle': 'Birth Chart', 'icon': Icons.star},
    {'name': 'Vastu', 'subtitle': 'Home Energy', 'icon': Icons.house},
    {'name': 'Journal & Reflection', 'subtitle': '', 'icon': Icons.book},
    {'name': 'Daily Dharma Feed', 'subtitle': '', 'icon': Icons.feed},
    {'name': 'Notification & Reminder', 'subtitle': '', 'icon': Icons.notifications},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF4E6),
      body: SafeArea(
        child: Column(
          children: [
            // Top bar with title and STT mic icon
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.deepOrange,
                    child: Text(
                      "WELLNESS\nHUB",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.mic, color: Colors.brown, size: 28),
                    onPressed: () {
                      // TODO: Trigger STT
                      print("🎤 Mic tapped");
                    },
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Ancient Wisdom.\nModern Healing.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                backgroundColor: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                elevation: 8,
                shadowColor: Colors.orangeAccent,
              ),
              child: const Text("Get Started", style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 14),

            // Scrollable Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 1.05,
                  children: features.map((feature) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PillarPage(pillarName: feature['name']),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.orange.shade100,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.orange.shade200,
                              blurRadius: 8,
                              offset: const Offset(2, 4),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(feature['icon'], size: 30, color: Colors.brown),
                            const SizedBox(height: 8),
                            Text(feature['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                            if ((feature['subtitle'] ?? '') != '')
                              Text(feature['subtitle'], style: const TextStyle(fontSize: 12, color: Colors.black87)),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "सर्वे भवन्तु सुखिनः",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.brown),
              ),
            )
          ],
        ),
      ),
    );
  }
}