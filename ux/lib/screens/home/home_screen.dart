import 'package:flutter/material.dart';
import '../../constants/route_paths.dart';
import 'home_screen_item.dart';
import 'home_screen_item_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0B1F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white24,
            child: Icon(Icons.person, color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today, color: Colors.orange),
            onPressed: () {
              Navigator.pushNamed(context, RoutePaths.calendar);
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.orange),
            onPressed: () {
              Navigator.pushReplacementNamed(context, RoutePaths.login);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _topAction(context, Icons.fact_check, 'Check-In', RoutePaths.checkIn),
                _topAction(context, Icons.calendar_today, 'Planner', RoutePaths.dailyPlanner),
                _topAction(context, Icons.person_outline, 'Profile', RoutePaths.profile),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Expanded(child: HomeScreenItemGrid()),
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.black.withOpacity(0.2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.chat_bubble_outline, color: Colors.orange, size: 20),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutePaths.aiBot);
                  },
                  child: const Text(
                    'Ask AI Assistant',
                    style: TextStyle(color: Colors.orange, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _topAction(BuildContext context, IconData icon, String label, String? route) {
    return Column(
      children: [
        InkWell(
          onTap: route != null
              ? () => Navigator.pushNamed(context, route)
              : null,
          child: CircleAvatar(
            radius: 28,
            backgroundColor: Colors.orange.shade100,
            child: Icon(icon, color: Colors.orange.shade800, size: 28),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}