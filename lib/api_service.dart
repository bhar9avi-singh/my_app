import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey = 'qt8lW6MqLdzb7ZUdr0PFaAYSqi7B1lkR';
  final String apiUrl = 'https://api.windy.com/api/point-forecast/v2';

  Future<Map<String, dynamic>> fetchWeatherData(String location) async {
    final response = await http.get(
      Uri.parse('$apiUrl?key=$apiKey&location=$location'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
