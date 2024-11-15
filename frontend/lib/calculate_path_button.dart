import 'package:flutter/material.dart';

class CalculatePathButton extends StatelessWidget {
  final VoidCallback onCalculate;
  final ValueChanged<String> onStartCityChanged;
  final ValueChanged<String> onEndCityChanged;
  final String? startCity;
  final String? endCity;

  const CalculatePathButton({
    required this.onCalculate,
    required this.onStartCityChanged,
    required this.onEndCityChanged,
    this.startCity,
    this.endCity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: onStartCityChanged,
                decoration: const InputDecoration(
                  labelText: 'Start City',
                ),
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                onChanged: onEndCityChanged,
                decoration: const InputDecoration(
                  labelText: 'End City',
                ),
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: onCalculate,
          child: const Text(
            'Calculate Shortest Path',
            style: TextStyle(color: Color.fromARGB(255, 69, 68, 68), fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
