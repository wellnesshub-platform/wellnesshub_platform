// lib/models/burnout_history_data.dart
import 'package:intl/intl.dart';

class BurnoutHistoryData {
  final DateTime checkinDate;
  final int burnoutScore;
  final String riskLevel;
  final String? notes; // Optional: if you want to include notes from history

  BurnoutHistoryData({
    required this.checkinDate,
    required this.burnoutScore,
    required this.riskLevel,
    this.notes,
  });

  factory BurnoutHistoryData.fromJson(Map<String, dynamic> json) {
    return BurnoutHistoryData(
      checkinDate: DateTime.parse(json['checkin_date']),
      burnoutScore: json['burnout_score'],
      riskLevel: json['risk_level'],
      notes: json['emotional_state'], // Assuming emotional_state from CheckinData could be used as notes
    );
  }

  String get formattedDate {
    return DateFormat.yMMMd().format(checkinDate); // e.g., May 20, 2024
  }
}