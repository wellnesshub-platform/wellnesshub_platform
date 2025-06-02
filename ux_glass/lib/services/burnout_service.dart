// lib/services/burnout_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/burnout_history_data.dart';
import '../models/burnout_prediction_response.dart';
import '../models/checkin_data_for_api.dart'; // Import the new CheckinDataForApi model

class BurnoutService {
  final String _baseUrl = 'http://10.0.2.2:8000'; // For Android Emulator. Adjust for iOS/device.

  Future<List<BurnoutHistoryData>> fetchBurnoutHistory(String userId) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/burnout/history?user_id=$userId'));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => BurnoutHistoryData.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load burnout history: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to server for history: $e');
    }
  }

  Future<BurnoutPredictionResponse> performBurnoutCheckin(CheckinDataForApi checkinData) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/burnout/checkin'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(checkinData.toJson()),
      );

      if (response.statusCode == 200) {
        return BurnoutPredictionResponse.fromJson(json.decode(response.body));
      } else {
        // Handle API errors (e.g., 400 Bad Request, 500 Internal Server Error)
        final errorBody = json.decode(response.body);
        throw Exception('Failed to perform check-in: ${response.statusCode} - ${errorBody['detail']}');
      }
    } catch (e) {
      throw Exception('Failed to connect to server for check-in: $e');
    }
  }
}