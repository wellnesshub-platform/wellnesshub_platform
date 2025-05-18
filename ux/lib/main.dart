import 'package:flutter/material.dart';
import 'screens/wellness_home_page.dart'; // Or the actual file where WellnessHomePage is

void main() {
  runApp(const WellnessHubApp());
}

class WellnessHubApp extends StatelessWidget {
  const WellnessHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wellness Hub',
      debugShowCheckedModeBanner: false,
      home: WellnessHomePage(), // This should match your actual widget
    );
  }
}