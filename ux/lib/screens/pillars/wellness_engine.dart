class WellnessEngine {
  static Future<Map<String, dynamic>> generatePlanner(Map<String, dynamic> checkInData) async {
    // Mock/stub AI model response — must return a valid map
    await Future.delayed(const Duration(seconds: 1)); // simulate async delay
    return {
      "daily_plan": [
        {"pillar": "Mind", "activity": "Morning meditation 🧘‍♂️"},
        {"pillar": "Body", "activity": "Yoga - Sun Salutation 🌞"},
        {"pillar": "Spirituality", "activity": "Read a Gita verse 📖"},
        {"pillar": "Satvik Food", "activity": "Warm ginger tea 🍵"},
        {"pillar": "Music & Raga", "activity": "Listen to Raga Bhairav 🎶"},
        {"pillar": "Journal", "activity": "Gratitude entry 🙏"},
      ]
    };
  }
}