import 'package:care_cloud/utilities/custom_vitals_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class VitalsInputGrid extends StatelessWidget {
  final List<TextEditingController> controllers;
  const VitalsInputGrid({super.key, required this.controllers});

  @override
  Widget build(BuildContext context) {
    final List<IconData> icons = [
      FontAwesomeIcons.wheelchair,
      FontAwesomeIcons.heartPulse,
      FontAwesomeIcons.temperatureThreeQuarters,
      FontAwesomeIcons.weightScale,
      FontAwesomeIcons.droplet,
      FontAwesomeIcons.dumbbell,
    ];

    final List<String> titles = ['BP', 'Pulse', 'Temp', 'Weight', 'SPO2', 'Exercise'];
    final List<String> measurementTexts = ['mmHG', 'bpm', '°C', 'kg', '%', 'mins'];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 1.1,
      ),
      itemCount: icons.length,
      itemBuilder: (context, index) {
        return CustomVitalsField(
          controller: controllers[index],
          faIcon: icons[index],
          title: titles[index],
          measurementText: measurementTexts[index],
        );
      },
    );
  }
}
