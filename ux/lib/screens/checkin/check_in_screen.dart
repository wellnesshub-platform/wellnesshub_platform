import 'package:flutter/material.dart';
import '../../constants/route_paths.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  String _activity = '';
  String _mood = '';
  String _hydration = '';
  double _sleepHours = 6;

  void _submitData() {
    final planOverride = [
      {'pillar': 'Body', 'activity': _activity, 'time': 'Morning'},
      {'pillar': 'Mind', 'activity': _mood, 'time': 'Afternoon'},
      {'pillar': 'Satvik Food', 'activity': 'Hydration: $_hydration', 'time': 'Evening'},
    ];

    Navigator.pushNamed(
      context,
      RoutePaths.dailyPlanner,
      arguments: planOverride,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0B1F),
      appBar: AppBar(
        title: const Text('Daily Check-In'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _section("🏃 Activity Level", _activity, (value) => setState(() => _activity = value), {
            'Sedentary': Icons.chair,
            'Light': Icons.directions_walk,
            'Active': Icons.fitness_center,
          }),
          const SizedBox(height: 20),
          _section("😌 Mood", _mood, (value) => setState(() => _mood = value), {
            'Happy': Icons.sentiment_very_satisfied,
            'Neutral': Icons.sentiment_neutral,
            'Sad': Icons.sentiment_dissatisfied,
          }),
          const SizedBox(height: 20),
          _section("💧 Hydration", _hydration, (value) => setState(() => _hydration = value), {
            'Low': Icons.local_drink_outlined,
            'Okay': Icons.water_drop,
            'Good': Icons.water,
          }),
          const SizedBox(height: 20),
          _sleepCard(),
          const SizedBox(height: 28),
          Center(
            child: ElevatedButton(
              onPressed: _submitData,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("Submit", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _section(String label, String selected, void Function(String) onSelect, Map<String, IconData> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: options.entries.map((entry) {
            final isSelected = entry.key == selected;
            return GestureDetector(
              onTap: () => onSelect(entry.key),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: isSelected ? Colors.orange : Colors.white24,
                    child: Icon(entry.value, color: isSelected ? Colors.white : Colors.orange, size: 26),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    entry.key,
                    style: TextStyle(color: isSelected ? Colors.orange : Colors.white70, fontSize: 13),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _sleepCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("🌙 Sleep Hours", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          Slider(
            value: _sleepHours,
            min: 0,
            max: 12,
            divisions: 12,
            label: "${_sleepHours.toStringAsFixed(0)} hrs",
            onChanged: (v) => setState(() => _sleepHours = v),
            activeColor: Colors.orange,
          ),
          Text("You slept ${_sleepHours.toStringAsFixed(0)} hours", style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}