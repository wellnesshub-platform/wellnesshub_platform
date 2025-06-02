// lib/models/burnout_data.dart
import 'package:intl/intl.dart';

class BurnoutData {
  final DateTime date;
  final int level;
  final String? notes;

  BurnoutData({
    required this.date,
    required this.level,
    this.notes,
  });

  factory BurnoutData.fromJson(Map<String, dynamic> json) {
    return BurnoutData(
      date: DateTime.parse(json['date']),
      level: json['level'],
      notes: json['notes'],
    );
  }

  // Optional: For displaying
  String get formattedDate {
    return DateFormat.yMMMd().format(date); // e.g., Jan 1, 2024
  }
}