// custom_bottom_navigation_bar.dart
import 'package:care_cloud/utilities/colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:project_1_carecloud/utilities/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      items: const [
        FaIcon(FontAwesomeIcons.house, color: AppColors.secondary),
        FaIcon(FontAwesomeIcons.fileMedical, color: AppColors.secondary),
        FaIcon(FontAwesomeIcons.userDoctor, color: AppColors.secondary),
        FaIcon(FontAwesomeIcons.user, color: AppColors.secondary),
      ],
      color: AppColors.primary,
      backgroundColor: AppColors.secondary,
      buttonBackgroundColor: AppColors.primary,
      animationDuration: const Duration(milliseconds: 300),
      onTap: onTap,
    );
  }
}
