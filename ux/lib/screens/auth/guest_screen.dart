import 'package:flutter/material.dart';
import '../../../constants/route_paths.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({super.key});

  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  final List<String> allPillars = [
    'Mind', 'Body', 'Spirituality', 'Ayurveda',
    'Satvik Food', 'Music & Raga', 'Pooja', 'Astrology',
    'Vastu', 'Journal', 'Dharma Feed', 'Reminders'
  ];

  final Set<String> selectedPillars = {};

  void _toggleSelection(String pillar) {
    setState(() {
      if (selectedPillars.contains(pillar)) {
        selectedPillars.remove(pillar);
      } else {
        selectedPillars.add(pillar);
      }
    });
  }

  void _continueAsGuest() {
    // Optionally send `selectedPillars` to backend
    Navigator.pushReplacementNamed(context, RoutePaths.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1),
      appBar: AppBar(
        title: const Text('Guest Preferences'),
        backgroundColor: const Color(0xFF8B4513),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose your interests (optional):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: allPillars.map((pillar) {
                final isSelected = selectedPillars.contains(pillar);
                return ChoiceChip(
                  label: Text(pillar),
                  selected: isSelected,
                  onSelected: (_) => _toggleSelection(pillar),
                  selectedColor: const Color(0xFF944B00),
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                  ),
                );
              }).toList(),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: _continueAsGuest,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFA726),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                ),
                child: const Text('Continue as Guest', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}