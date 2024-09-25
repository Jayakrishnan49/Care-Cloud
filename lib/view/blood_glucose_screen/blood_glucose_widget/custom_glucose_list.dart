import 'package:flutter/material.dart';

class CustomBloodGlucoseCard extends StatelessWidget {
  final String text1; // Date and Time
  final String text2; // Food Intake Timings
  final String text3; // Glucose Level

  const CustomBloodGlucoseCard({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Card(
        elevation: 2,
        color: Colors.white70,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text1, // Date and Time
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    text2, // Food Intake Timings
                    style: const TextStyle(color: Colors.black54),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    text3, // Glucose Level
                    style: const TextStyle(
                        fontSize: 18, color: Colors.blue), // You can replace Colors.blue with your desired color.
                  ),
                  const Text('mg/dL'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
  