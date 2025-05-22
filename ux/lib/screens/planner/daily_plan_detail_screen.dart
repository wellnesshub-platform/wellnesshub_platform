import 'package:flutter/material.dart';

class DailyPlanDetailScreen extends StatelessWidget {
  final String pillar;
  final String detail;

  const DailyPlanDetailScreen({
    super.key,
    required this.pillar,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF4E3),
      appBar: AppBar(
        backgroundColor: const Color(0xFF944B00),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          pillar,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF944B00), width: 1.2),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
            ],
          ),
          child: Text(
            detail,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xFF4E342E),
              height: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}