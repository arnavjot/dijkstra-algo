import 'package:http/http.dart' as http;
import 'dart:convert';

// Function to fetch all cities (for city list in the UI)
Future<List<Map<String, dynamic>>> fetchAllCities() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:3000/cities'));
  if (response.statusCode == 200) {
    return List<Map<String, dynamic>>.from(json.decode(response.body));
  } else {
    throw Exception('Failed to fetch cities');
  }
}

// Function to calculate the shortest path from startCity to endCity
Future<List<String>> calculateShortestPath(String startCity, String endCity) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:3000/calculate-path'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'startCity': startCity, 'endCity': endCity}),
  );

  if (response.statusCode == 200) {
    // Parse the response to get the shortest path list
    final jsonResponse = json.decode(response.body);
    final path = List<String>.from(jsonResponse['shortestPath']);
    print("Shortest Path from API: $path"); // Debugging log to confirm received path
    return path;
  } else {
    throw Exception('Failed to calculate shortest path');
  }
}
