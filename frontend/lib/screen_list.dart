import 'package:flutter/material.dart';
import 'calculate_path_button.dart';
import 'fetch_data.dart';
import 'city_graph.dart';

class CityListScreen extends StatefulWidget {
  @override
  _CityListScreenState createState() => _CityListScreenState();
}

class _CityListScreenState extends State<CityListScreen> {
  List<Map<String, dynamic>>? cities = [];
  List<String> shortestPath = [];
  String? startCity;
  String? endCity;
  bool isHovered = false; // State to track hover status

  @override
  void initState() {
    super.initState();
    _loadCities();
  }

  Future<void> _loadCities() async {
    try {
      final loadedCities = await fetchAllCities();
      setState(() {
        cities = loadedCities;
      });
    } catch (e) {
      print('Error loading cities: $e');
    }
  }

  Future<void> _calculatePath() async {
    if (startCity != null && endCity != null) {
      try {
        final path = await calculateShortestPath(startCity!, endCity!);
        setState(() {
          shortestPath = path;
        });
      } catch (e) {
        print('Error calculating path: $e');
      }
    } else {
      print('Start and end cities must be selected.');
    }
  }

  void _showFullScreenImage(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        child: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: InteractiveViewer(
            child: Image.asset(
              'assets/map.png', // Path to the map image
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dijkstra Shortest Path Finder',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: cities != null && cities!.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Map image with border and hover effect
                  MouseRegion(
                    onEnter: (_) => setState(() => isHovered = true),
                    onExit: (_) => setState(() => isHovered = false),
                    child: GestureDetector(
                      onTap: () => _showFullScreenImage(context),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.deepPurple, width: 2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset(
                              'assets/map.png', // Path to the map image
                              height: 100, // Small thumbnail size
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Show "Click Here" text on hover
                          if (isHovered)
                            Container(
                              color: Colors.black54,
                              width: 100,
                              height: 100,
                              alignment: Alignment.center,
                              child: const Text(
                                'Click Here',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  CalculatePathButton(
                    startCity: startCity,
                    endCity: endCity,
                    onCalculate: _calculatePath,
                    onStartCityChanged: (value) => setState(() => startCity = value),
                    onEndCityChanged: (value) => setState(() => endCity = value),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: CityGraph(
                      cityNames: cities!.map((city) => city['name'] as String).toList(),
                      shortestPathSet: shortestPath,
                      startCity: startCity,
                      endCity: endCity,
                      waypoints: [],
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (shortestPath.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Shortest Path: ${shortestPath.join(" -> ")}',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
