
// ignore: file_names
import 'package:care_cloud/utilities/colors.dart';
import 'package:flutter/material.dart';


class CustomradiobuttonFoodintake extends StatelessWidget {
  final String label;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  const CustomradiobuttonFoodintake({
    super.key,
    required this.label,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          activeColor: AppColors.primary,
          value: label,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(label),
      ],
    );
  }
}
