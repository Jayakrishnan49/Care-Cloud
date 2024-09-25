import 'dart:io';
import 'package:care_cloud/utilities/colors.dart';
import 'package:flutter/material.dart';


class ProfileAvatar extends StatelessWidget {
  final String imagePath;

  const ProfileAvatar({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0, // Adjust the size as needed
      height: 150.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.secondary, // Outline color
          width: 3.0, // Outline width
        ),
      ),
      child: CircleAvatar(
        radius: 200,
        backgroundImage: FileImage(File(imagePath)),
      ),
    );
  }
}
