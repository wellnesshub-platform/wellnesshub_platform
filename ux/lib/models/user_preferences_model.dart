class UserPreferences {
  final List<String> pillars;
  final String plannerType;
  final String language;

  UserPreferences({
    required this.pillars,
    required this.plannerType,
    required this.language,
  });

  Map<String, dynamic> toMap() {
    return {
      'pillars': pillars,
      'plannerType': plannerType,
      'language': language,
    };
  }

  factory UserPreferences.fromMap(Map<String, dynamic> map) {
    return UserPreferences(
      pillars: List<String>.from(map['pillars'] ?? []),
      plannerType: map['plannerType'] ?? 'check-in',
      language: map['language'] ?? 'English',
    );
  }
}