import 'package:flutter/material.dart';

void main() {
  runApp(const WellnessModuleApp());
}

class WellnessModuleApp extends StatelessWidget {
  const WellnessModuleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wellness Module UX',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Wellness UX Module')),
        body: const Center(child: Text('Welcome to Wellness Module UX')),
      ),
    );
  }
}
