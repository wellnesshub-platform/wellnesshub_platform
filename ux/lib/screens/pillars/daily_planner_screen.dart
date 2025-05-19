import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'daily_plan_detail_screen.dart';

class DailyScreen extends StatefulWidget {
  const DailyScreen({super.key});

  @override
  State<DailyScreen> createState() => _DailyScreenState();
}

class _DailyScreenState extends State<DailyScreen> {
  List<Map<String, dynamic>> dailyPlan = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPlanner();
  }

  Future<void> _loadPlanner() async {
    try {
      final jsonStr = await rootBundle.loadString('assets/ai_daily_plan_sample.json');
      final data = json.decode(jsonStr);
      final plan = List<Map<String, dynamic>>.from(data['daily_plan']);
      print('Parsed plan items: $plan');  // Add this after: plan.sort(...)
      plan.sort((a, b) => a['time'].compareTo(b['time']));

      setState(() {
        dailyPlan = plan;
        isLoading = false;
      });
    } catch (e) {
      debugPrint('Failed to load plan: $e');
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF4E3),
      appBar: AppBar(
        backgroundColor: const Color(0xFF944B00),
        title: const Text("Your Daily Wellness Plan", style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: dailyPlan.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = dailyPlan[index];
                final time = item['time'] ?? '';
                final pillar = item['pillar'] ?? 'Unknown';
                final detail = item['activity'] ?? 'No detail';

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DailyPlanDetailScreen(
                          pillar: pillar,
                          detail: detail,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFF944B00), width: 1.3),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          time,
                          style: const TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.orange.shade100,
                              radius: 18,
                              child: Text(
                                pillar[0],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    pillar,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF5E2600),
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    detail,
                                    style: const TextStyle(fontSize: 14, color: Colors.black87, height: 1.4),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}