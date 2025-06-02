enum PlantGrowthStage {
  SEEDLING,
  SPROUT,
  BUD,
  BLOOM,
}

class Plant {
  final String id;
  final String typeId; // e.g., 'consistency_flower', 'milestone_bush'
  final PlantGrowthStage currentStage;
  final int progressToNextStage; // e.g., 0–100
  final DateTime unlockedDate;

  Plant({
    required this.id,
    required this.typeId,
    required this.currentStage,
    required this.progressToNextStage,
    required this.unlockedDate,
  });

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      id: json['id'],
      typeId: json['typeId'],
      currentStage: PlantGrowthStage.values.firstWhere(
        (e) => e.toString().split('.').last.toLowerCase() ==
               json['growthStage'].toString().toLowerCase(),
        orElse: () => PlantGrowthStage.SEEDLING,
      ),
      progressToNextStage: json['progressToNextStage'] ?? 0,
      unlockedDate: DateTime.parse(json['unlockedDate']),
    );
  }
}