class WellnessEngine {
  Future<Map<String, dynamic>> generatePlanner(Map<String, dynamic> healthData) async {
    await Future.delayed(const Duration(seconds: 1)); // simulate delay

    return {
      "daily_plan": [
        {"type": "Mind", "activity": "Morning Meditation"},
        {"type": "Mind", "activity": "Evening Affirmations"},
        {"type": "Body", "activity": "Yoga Routine"},
        {"type": "Body", "activity": "Breathwork Practice"},
        {"type": "Spirituality", "activity": "Pooja Reminder"},
        {"type": "Spirituality", "activity": "Today’s Gita Quote"},
        {"type": "Music & Raga", "activity": "Bhajan of the Day"},
        {"type": "Music & Raga", "activity": "Recommended Raga"},
        {"type": "Journal", "activity": "Write Morning Intention"},
        {"type": "Journal", "activity": "Evening Gratitude"},
      ]
    };
  }
}