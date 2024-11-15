import 'package:flutter/material.dart';
import 'city_card.dart';

class CityGraph extends StatelessWidget {
  final List<String> cityNames;
  final List<String> shortestPathSet;
  final String? startCity;
  final String? endCity;
  final List<String> waypoints;

  const CityGraph({
    required this.cityNames,
    required this.shortestPathSet,
    this.startCity,
    this.endCity,
    required this.waypoints,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
      ),
      itemCount: cityNames.length,
      itemBuilder: (context, index) {
        final cityName = cityNames[index];
        final isInShortestPath = shortestPathSet.contains(cityName);
        final isStartCity = cityName == startCity;
        final isEndCity = cityName == endCity;
        final isWaypoint = waypoints.contains(cityName);

        return CityCard(
          cityName: cityName,
          isInShortestPath: isInShortestPath || isStartCity || isEndCity || isWaypoint,
        );
      },
    );
  }
}
