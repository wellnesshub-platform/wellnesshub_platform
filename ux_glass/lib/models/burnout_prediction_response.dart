// lib/models/burnout_prediction_response.dart
class BurnoutPredictionResponse {
  final int burnoutScore;
  final String riskLevel;
  final List<String> recommendations;

  BurnoutPredictionResponse({
    required this.burnoutScore,
    required this.riskLevel,
    required this.recommendations,
  });

  factory BurnoutPredictionResponse.fromJson(Map<String, dynamic> json) {
    return BurnoutPredictionResponse(
      burnoutScore: json['burnout_score'],
      riskLevel: json['risk_level'],
      recommendations: List<String>.from(json['recommendations']),
    );
  }
}   