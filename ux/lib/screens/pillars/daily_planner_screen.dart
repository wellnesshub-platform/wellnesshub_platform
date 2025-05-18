import 'package:flutter/material.dart';

class DailyPlannerScreen extends StatelessWidget {
  const DailyPlannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B4513),
        title: const Text(
          'Daily Planner',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildPlannerSection(
            context,
            title: '🧠 Mind',
            actions: [
              _PlannerAction(label: 'Morning Meditation', onTap: () {/* Navigate to Meditation */}),
              _PlannerAction(label: 'Evening Affirmations', onTap: () {/* Navigate to Affirmations */}),
            ],
          ),
          const SizedBox(height: 16),
          _buildPlannerSection(
            context,
            title: '🧘 Body',
            actions: [
              _PlannerAction(label: 'Yoga Routine', onTap: () {/* Navigate to Yoga */}),
              _PlannerAction(label: 'Breathwork Practice', onTap: () {/* Navigate to Breathwork */}),
            ],
          ),
          const SizedBox(height: 16),
          _buildPlannerSection(
            context,
            title: '🙏 Spirituality',
            actions: [
              _PlannerAction(label: 'Pooja Reminder', onTap: () {/* Navigate to Pooja */}),
              _PlannerAction(label: 'Today\'s Gita Quote', onTap: () {/* Navigate to Dharma */}),
            ],
          ),
          const SizedBox(height: 16),
          _buildPlannerSection(
            context,
            title: '🎶 Music & Raga',
            actions: [
              _PlannerAction(label: 'Bhajan of the Day', onTap: () {/* Navigate to Bhajan */}),
              _PlannerAction(label: 'Recommended Raga', onTap: () {/* Navigate to Raga */}),
            ],
          ),
          const SizedBox(height: 16),
          _buildPlannerSection(
            context,
            title: '📓 Journal & Reflection',
            actions: [
              _PlannerAction(label: 'Write Morning Intention', onTap: () {/* Navigate to Journal */}),
              _PlannerAction(label: 'Evening Gratitude', onTap: () {/* Navigate to Journal */}),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlannerSection(BuildContext context,
      {required String title, required List<_PlannerAction> actions}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.brown.shade100,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ...actions.map((action) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: GestureDetector(
                  onTap: action.onTap,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.brown.shade300),
                    ),
                    child: Text(action.label, style: const TextStyle(fontSize: 16)),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class _PlannerAction {
  final String label;
  final VoidCallback onTap;
  _PlannerAction({required this.label, required this.onTap});
}