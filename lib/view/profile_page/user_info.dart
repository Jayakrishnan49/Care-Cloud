import 'package:care_cloud/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class UserInfo extends StatelessWidget {
  final String username;
  final String gender;
  final String age;

  const UserInfo({
    required this.username,
    required this.gender,
    required this.age,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          username,
          style: const TextStyle(fontSize: 20, color: AppColors.secondary),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  const FaIcon(
                    FontAwesomeIcons.person,
                    color: AppColors.secondary,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Gender',
                    style: TextStyle(color: AppColors.secondary),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    gender,
                    style: const TextStyle(color: AppColors.secondary),
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
              width: 2,
              color: AppColors.secondary,
            ),
            Expanded(
              child: Column(
                children: [
                  const FaIcon(
                    FontAwesomeIcons.calendar,
                    color: AppColors.secondary,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Age',
                    style: TextStyle(color: AppColors.secondary),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    age,
                    style: const TextStyle(color: AppColors.secondary),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
