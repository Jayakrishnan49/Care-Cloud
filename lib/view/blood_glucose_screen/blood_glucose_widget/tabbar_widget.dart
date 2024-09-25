import 'package:care_cloud/utilities/colors.dart';
import 'package:flutter/material.dart';
// import 'package:project_1_carecloud/utilities/colors.dart';

class BloodGlucoseTabBar extends StatelessWidget {
  const BloodGlucoseTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      dividerHeight: 0,
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: AppColors.primary,
      indicatorColor: AppColors.primary,
      labelStyle: TextStyle(fontSize: 18),
      unselectedLabelColor: AppColors.title,
      tabs: [
        Tab(text: 'Add Blood Glucose'),
        Tab(text: 'View'),
      ],
    );
  }
}
