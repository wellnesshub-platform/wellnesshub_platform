import 'package:flutter/material.dart';
import '../../widgets/pillar_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> pillars = const [
    {'name': 'Mind', 'icon': Icons.psychology, 'route': '/mind', 'subtitle': 'Meditations & AH.'},
    {'name': 'Body', 'icon': Icons.self_improvement, 'route': '/body', 'subtitle': 'Yoga & Breathwork'},
    {'name': 'Spirituality', 'icon': Icons.auto_awesome, 'route': '/spirituality', 'subtitle': 'Gita Wisdom & Seva'},
    {'name': 'Ayurveda', 'icon': Icons.local_florist, 'route': '/ayurveda', 'subtitle': 'Dosha & Herbs'},
    {'name': 'Satvik Food', 'icon': Icons.restaurant, 'route': '/satvik-food', 'subtitle': 'Clean Food'},
    {'name': 'Music & Raga', 'icon': Icons.music_note, 'route': '/music-raga', 'subtitle': 'Sound Healing'},
    {'name': 'Pooja', 'icon': Icons.local_fire_department, 'route': '/pooja', 'subtitle': 'Daily Rituals'},
    {'name': 'Astrology', 'icon': Icons.star, 'route': '/astrology', 'subtitle': 'Karmic Paths'},
    {'name': 'Vastu', 'icon': Icons.home, 'route': '/vastu', 'subtitle': 'Sacred Space'},
    {'name': 'Journal', 'icon': Icons.book, 'route': '/journal', 'subtitle': 'Reflect & Heal'},
    {'name': 'Dharma Feed', 'icon': Icons.feed, 'route': '/dharma', 'subtitle': 'Daily Wisdom'},
    {'name': 'Reminders', 'icon': Icons.notifications, 'route': '/reminders', 'subtitle': 'Spiritual Nudges'},
  ];

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 600), vsync: this);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF4E3),
      appBar: AppBar(
        backgroundColor: const Color(0xFF944B00),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/wellnesshub-logo.png', height: 42),
            const SizedBox(width: 8),
            const Text('Wellness Hub', style: TextStyle(color: Colors.white)),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.mic, color: Colors.white),
          onPressed: () {},
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          const Text(
            "Ancient Wisdom.\nModern Healing.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFF5E2600),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/daily-planner'); // Navigate to your planner screen
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFA726),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 6,
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Text('Daily Planner', style: TextStyle(color: Colors.white)),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.85,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              padding: const EdgeInsets.all(12),
              children: List.generate(pillars.length, (index) {
                final pillar = pillars[index];
                return FadeTransition(
                  opacity: CurvedAnimation(
                    parent: _controller,
                    curve: Interval(0.05 * index, 1.0, curve: Curves.easeIn),
                  ),
                  child: PillarButton(
                    name: pillar['name'],
                    icon: pillar['icon'],
                    subtitle: pillar['subtitle'],
                    onTap: () => Navigator.pushNamed(context, pillar['route']),
                  ),
                );
              }),
            ),
          ),
          const Text(
            'सर्वे भवन्तु सुखिनः',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF5E2600),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}