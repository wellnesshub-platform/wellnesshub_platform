import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/daily_plan.dart';
import 'config.dart';

class ApiService {
  Future<DailyPlanResponse> getDailyPlan() async {
    final url = Uri.parse('${Config.apiBaseUrl}/daily-plan');
    final response = await http.post(url, body: jsonEncode({'userId': 123}));

    if (response.statusCode == 200) {
      return DailyPlanResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch daily plan');
    }
  }
}