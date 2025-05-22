import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({Key? key}) : super(key: key);

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FirebaseFirestore _db = FirebaseFirestore.instance;

  final List<String> pillars = [
    'Mind', 'Body', 'Spirituality', 'Ayurveda',
    'Satvik Food', 'Music & Raga', 'Pooja', 'Astrology',
    'Vastu', 'Journal', 'Dharma Feed', 'Reminders'
  ];

  List<String> selectedPillars = [];
  String plannerType = 'check-in';
  String language = 'English';

  void togglePillar(String pillar) {
    setState(() {
      if (selectedPillars.contains(pillar)) {
        selectedPillars.remove(pillar);
      } else {
        selectedPillars.add(pillar);
      }
    });
  }

  Future<void> savePreferences() async {
    // final user = _auth.currentUser;
    // if (user == null) return;

    // await _db.collection('users').doc(user.uid).update({
    //   'preferences': {
    //     'pillars': selectedPillars,
    //     'plannerType': plannerType,
    //     'language': language,
    //     'updatedAt': FieldValue.serverTimestamp(),
    //   }
    // });

    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Wellness Preferences')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Select Wellness Pillars:", style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
              spacing: 8,
              children: pillars.map((pillar) {
                final selected = selectedPillars.contains(pillar);
                return FilterChip(
                  label: Text(pillar),
                  selected: selected,
                  onSelected: (_) => togglePillar(pillar),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text("Choose Daily Planner Type:"),
            RadioListTile(
              title: const Text('Check-in Based'),
              value: 'check-in',
              groupValue: plannerType,
              onChanged: (value) => setState(() => plannerType = value.toString()),
            ),
            RadioListTile(
              title: const Text('Default Auto Planner'),
              value: 'default',
              groupValue: plannerType,
              onChanged: (value) => setState(() => plannerType = value.toString()),
            ),
            const SizedBox(height: 20),
            const Text("Preferred Language:"),
            DropdownButton<String>(
              value: language,
              onChanged: (value) => setState(() => language = value!),
              items: ['English', 'Hindi', 'Gujarati', 'Tamil']
                  .map((lang) => DropdownMenuItem(value: lang, child: Text(lang)))
                  .toList(),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: savePreferences,
                child: const Text('Save & Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}