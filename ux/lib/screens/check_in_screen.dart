import 'package:flutter/material.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  String _activityLevel = '';
  double _stressLevel = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B4513),
        title: const Text("Check-In", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text("🏃 Activity Level", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: ['Sedentary', 'Light', 'Active'].map((level) {
                return ChoiceChip(
                  label: Text(level),
                  selected: _activityLevel == level,
                  onSelected: (selected) {
                    setState(() {
                      _activityLevel = selected ? level : '';
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            const Text("🧠 Stress Level", style: TextStyle(fontWeight: FontWeight.bold)),
            Slider(
              value: _stressLevel,
              min: 1,
              max: 10,
              divisions: 9,
              label: _stressLevel.round().toString(),
              activeColor: Colors.orange.shade700,
              onChanged: (v) {
                setState(() {
                  _stressLevel = v;
                });
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Check-in saved ✅")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B4513),
              ),
              child: const Text("Submit", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}