// lib/home_screen.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Make sure this is imported
import 'utils.dart';
import 'wellness_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _buildRitualStep(
      {required IconData icon,
      required Color iconColor,
      required String text,
      required IconData statusIcon,
      required Color statusColor,
      String? time}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: iconColor, shadows: iconShadows),
          const SizedBox(width: 15),
          Expanded(
            child: Text.rich(TextSpan(children: [
              TextSpan(text: text, style: const TextStyle(fontSize: 16)),
              if (time != null)
                TextSpan(
                    text: ' ($time)',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600])),
            ])),
          ),
          Icon(statusIcon, color: statusColor, shadows: iconShadows),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, bottom: 10.0),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser; // Ensure User type is recognized
    final String userName = user?.displayName ?? user?.email ?? 'User';

    return SingleChildScrollView( // Ensure this is the root widget returned
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                children: <TextSpan>[
                  const TextSpan(text: 'Hello, '),
                  TextSpan(
                      text: userName,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '\n${getTimeBasedGreeting()}'),
                ],
              ),
            ),
          ),

          // --- Zone B: Ritual Thread ---
          _buildSectionHeader("Today's Ritual Thread"),
          TrackerCard( // Make sure TrackerCard is defined in wellness_widgets.dart
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Row(children: [
                Icon(Icons.stream, color: Colors.green, shadows: iconShadows),
                SizedBox(width: 8),
                Text("Today's Flow Journey",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
              ]),
              const Divider(height: 25, thickness: 1),
              _buildRitualStep(
                  icon: Icons.air,
                  iconColor: Colors.blueAccent,
                  text: 'Step 1: 5-min Breathwork',
                  statusIcon: Icons.check_circle,
                  statusColor: Colors.green),
              _buildRitualStep(
                  icon: Icons.edit_note,
                  iconColor: Colors.orange,
                  text: 'Step 2: Write 3-line reflection',
                  statusIcon: Icons.hourglass_bottom,
                  statusColor: Colors.orange),
              _buildRitualStep(
                  icon: Icons.music_note,
                  iconColor: Colors.purple,
                  text: 'Step 3: End with Bhajan',
                  time: "8PM",
                  statusIcon: Icons.directions_run,
                  statusColor: Colors.grey),
              const SizedBox(height: 15),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text("[Track My Flow ->]",
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold)))),
            ]),
          ),
          const SizedBox(height: 20),

          // --- Zone C: Your Vitals ---
          _buildSectionHeader("Your Vitals"),
          const BurnoutTrackerCard(), // Make sure this and other cards are defined
          const SizedBox(height: 20),
          HappinessTrackerCard(),
          const SizedBox(height: 20),
          const MoodTrackerCard(),

          // --- Zone D: Today's Focus ---
          _buildSectionHeader("Today's Focus"),
          TodayEnergyCard(),
          const SizedBox(height: 20),
          const AiRitualCard(),
          const SizedBox(height: 20),
          const TodayPlannerCard(),

          // --- Zone E: Your Progress ---
          _buildSectionHeader("Your Progress"),
          const ConsistencyTrackerCard(),
          const SizedBox(height: 30), // For bottom scroll padding
        ],
      ),
    );
  }
}