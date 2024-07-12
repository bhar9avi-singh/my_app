import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key); // Fixed the constructor signature
  const MyApp({super.key, Key? appKey});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WeatherApp(),
    );
  }
}

class WeatherApp extends StatefulWidget {
  //const WeatherApp({Key? key}): super(key: key); // Fixed the constructor signature
  const WeatherApp({super.key, Key? appKey});
  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final String apiKey = 'qt8lW6MqLdzb7ZUdr0PFaAYSqi7B1lkR';
  final String apiUrl = 'https://api.windy.com/api/point-forecast/v2';

  Future<Map<String, dynamic>> fetchData() async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({
          'lat': 49.809,
          'lon': 16.787,
          'model': 'gfs',
          'parameters': ['temp', 'wind'],
          'levels': ['surface'],
          'key': apiKey,
        }),
      );

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        if (decodedData != null) {
          return decodedData;
        } else {
          throw Exception('API response is null');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e'); // Improved error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather App')),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error fetching data: ${snapshot.error}'));
          } else {
            // Extract data from the API response
            final weatherData = snapshot.data;
            final temperature = weatherData?['temp']?['surface']?['values']?[0];
            final windSpeed = weatherData?['wind']?['surface']?['values']?[0];

            // Display data in a DataTable
            return Center(
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Parameter')),
                  DataColumn(label: Text('Value')),
                ],
                rows: [
                  DataRow(cells: [
                    const DataCell(Text('Temperature')),
                    DataCell(Text('$temperature °C')),
                  ]),
                  DataRow(cells: [
                    const DataCell(Text('Wind Speed')),
                    DataCell(Text('$windSpeed m/s')),
                  ]),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
