// lib/models/checkin_data_for_api.dart
// This represents the data payload you send to the FastAPI /burnout/checkin endpoint
class CheckinDataForApi {
  final String userId;
  final String checkinDate; // YYYY-MM-DD
  final double sleepHours;
  final String sleepQuality; // "poor", "average", "good"
  final int stressLevel; // 1-5
  final String mood; // "😞", "😐", "🙂", "😄", "🧘"
  final String activityLevel; // "none", "low", "medium", "high"
  final String mealTiming; // "on_time", "late", "skipped"
  final int hydrationGlasses;
  final bool didMeditation;
  final double sunlightHours;
  final double temperature;
  final int humidity;
  final int cloudCover;
  final double rainfallMm;
  final String lastMealTime; // HH:MM
  final String lastExerciseTime; // HH:MM
  final String exerciseType; // "none", "walk", "yoga", "strength", "cardio"
  final int exerciseDuration;
  final bool hadFastMorningWorkout;
  final double weight;
  final String weightUnit; // "kg", "lbs"
  final double heightCm;
  final bool wakeUpFresh;
  final bool overthinkingToday;
  final bool cravingJunkToday;
  final bool ateSugarToday;
  final int caffeineIntakeMg;
  final bool didGratitude;
  final bool feltRushedToday;
  final int socialInteractionQuality; // 1-5
  final int energyLevel; // 1-5
  final bool hadFamilyConflictToday;
  final bool feltUnheardByFamily;
  final bool caregivingResponsibility;
  final int familyEmotionalSupport; // 1-5
  final int stepsCount;
  final bool hadNapToday;
  final String? emotionalState;


  CheckinDataForApi({
    required this.userId,
    required this.checkinDate,
    required this.sleepHours,
    required this.sleepQuality,
    required this.stressLevel,
    required this.mood,
    required this.activityLevel,
    required this.mealTiming,
    required this.hydrationGlasses,
    required this.didMeditation,
    required this.sunlightHours,
    required this.temperature,
    required this.humidity,
    required this.cloudCover,
    required this.rainfallMm,
    required this.lastMealTime,
    required this.lastExerciseTime,
    required this.exerciseType,
    required this.exerciseDuration,
    required this.hadFastMorningWorkout,
    required this.weight,
    required this.weightUnit,
    required this.heightCm,
    required this.wakeUpFresh,
    required this.overthinkingToday,
    required this.cravingJunkToday,
    required this.ateSugarToday,
    required this.caffeineIntakeMg,
    required this.didGratitude,
    required this.feltRushedToday,
    required this.socialInteractionQuality,
    required this.energyLevel,
    required this.hadFamilyConflictToday,
    required this.feltUnheardByFamily,
    required this.caregivingResponsibility,
    required this.familyEmotionalSupport,
    required this.stepsCount,
    required this.hadNapToday,
    this.emotionalState,
  });

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'checkin_date': checkinDate,
      'sleep_hours': sleepHours,
      'sleep_quality': sleepQuality,
      'stress_level': stressLevel,
      'mood': mood,
      'activity_level': activityLevel,
      'meal_timing': mealTiming,
      'hydration_glasses': hydrationGlasses,
      'did_meditation': didMeditation,
      'sunlight_hours': sunlightHours,
      'temperature': temperature,
      'humidity': humidity,
      'cloud_cover': cloudCover,
      'rainfall_mm': rainfallMm,
      'last_meal_time': lastMealTime,
      'last_exercise_time': lastExerciseTime,
      'exercise_type': exerciseType,
      'exercise_duration': exerciseDuration,
      'had_fast_morning_workout': hadFastMorningWorkout,
      'weight': weight,
      'weight_unit': weightUnit,
      'height_cm': heightCm,
      'wake_up_fresh': wakeUpFresh,
      'overthinking_today': overthinkingToday,
      'craving_junk_today': cravingJunkToday,
      'ate_sugar_today': ateSugarToday,
      'caffeine_intake_mg': caffeineIntakeMg,
      'did_gratitude': didGratitude,
      'felt_rushed_today': feltRushedToday,
      'social_interaction_quality': socialInteractionQuality,
      'energy_level': energyLevel,
      'had_family_conflict_today': hadFamilyConflictToday,
      'felt_unheard_by_family': feltUnheardByFamily,
      'caregiving_responsibility': caregivingResponsibility,
      'family_emotional_support': familyEmotionalSupport,
      'steps_count': stepsCount,
      'had_nap_today': hadNapToday,
      'emotional_state': emotionalState,
    };
  }
}