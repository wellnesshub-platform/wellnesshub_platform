import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config.dart';

class ApiService {
  static Future<String> fetchPillarData(String pillarName) async {
    final response = await http.get(Uri.parse("\$baseUrl/api/\${pillarName.toLowerCase().replaceAll(' ', '_')}"));
    if (response.statusCode == 200) {
      return json.decode(response.body)['message'] ?? "No response message";
    } else {
      throw Exception('Failed to load data');
    }
  }
}