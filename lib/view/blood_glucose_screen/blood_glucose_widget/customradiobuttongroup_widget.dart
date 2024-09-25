// ignore_for_file: file_names

import 'package:care_cloud/utilities/colors.dart';
import 'package:flutter/material.dart';
// import 'package:project_1_carecloud/utilities/colors.dart';

class CustomRadioButtonGroup extends StatelessWidget {
  final List<String> labels;
  final String? groupValue;
  final ValueChanged<String?> onChanged;
  final Color selectionColor;

  const CustomRadioButtonGroup({
    super.key,
    required this.labels,
    required this.groupValue,
    required this.onChanged,
     this.selectionColor = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: labels.map((label) {
        return RadioListTile<String>(
          title: Text(label),
          value: label,
          groupValue: groupValue,
          onChanged: onChanged,
           activeColor: selectionColor,
        );
      }).toList(),
    );
  }
}
