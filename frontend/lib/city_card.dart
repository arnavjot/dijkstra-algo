import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final String cityName;
  final bool isInShortestPath;

  const CityCard({
    required this.cityName,
    required this.isInShortestPath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardColor = isInShortestPath ? const Color.fromARGB(255, 96, 199, 100) : Colors.red;

    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          cityName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
