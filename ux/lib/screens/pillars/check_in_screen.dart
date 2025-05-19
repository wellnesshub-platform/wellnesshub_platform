import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'daily_screen.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  String activity = 'Light';
  double stress = 5.0;
  String mood = 'Neutral';
  int energy = 3;
  bool digestiveIssue = false;
  String menstrualPhase = 'none';

  void _submitCheckIn() async {
    final dummyHealthData = {
      "activity_level": activity,
      "stress_level": stress.toInt(),
      "mood": mood.toLowerCase(),
      "energy_level": energy,
      "digestive_issue": digestiveIssue,
      "menstrual_phase": menstrualPhase
    };

    try {
      final jsonStr = await rootBundle.loadString('assets/ai_daily_plan_sample.json');
      final data = json.decode(jsonStr);
      final plan = List<Map<String, dynamic>>.from(data['daily_plan']);

      plan.sort((a, b) => a['time'].compareTo(b['time']));

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DailyScreen(planOverride: plan),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e"), backgroundColor: Colors.red),
      );
    }
  }

  Widget buildChips(String label, List<String> options, String selected, void Function(String) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Wrap(
          spacing: 10,
          children: options.map((value) {
            return ChoiceChip(
              label: Text(value),
              selected: selected == value,
              onSelected: (_) => setState(() => onChanged(value)),
              backgroundColor: Colors.orange.shade100,
              selectedColor: Colors.orange.shade700,
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF4E3),
      appBar: AppBar(
        backgroundColor: const Color(0xFF944B00),
        title: const Text("Check-In", style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildChips("🏃 Activity Level", ['Sedentary', 'Light', 'Active'], activity, (v) => activity = v),
          const Text("🧠 Stress Level", style: TextStyle(fontWeight: FontWeight.bold)),
          Slider(
            value: stress,
            min: 1,
            max: 10,
            divisions: 9,
            label: stress.toStringAsFixed(0),
            activeColor: Colors.orange.shade700,
            onChanged: (v) => setState(() => stress = v),
          ),
          const SizedBox(height: 16),
          buildChips("🙂 Mood", ['Happy', 'Neutral', 'Sad'], mood, (v) => mood = v),
          const Text("⚡ Energy Level", style: TextStyle(fontWeight: FontWeight.bold)),
          Slider(
            value: energy.toDouble(),
            min: 1,
            max: 5,
            divisions: 4,
            label: energy.toString(),
            activeColor: Colors.orange.shade700,
            onChanged: (v) => setState(() => energy = v.toInt()),
          ),
          const SizedBox(height: 16),
          SwitchListTile(
            title: const Text("🤢 Digestive Issues?"),
            value: digestiveIssue,
            onChanged: (v) => setState(() => digestiveIssue = v),
            activeColor: Colors.orange.shade700,
          ),
          buildChips("🌙 Menstrual Phase", ['none', 'follicular', 'ovulation', 'luteal'], menstrualPhase, (v) => menstrualPhase = v),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _submitCheckIn,
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF944B00)),
            child: const Text("Generate My Plan", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}