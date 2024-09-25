import 'package:care_cloud/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        title: const Text("Terms and Conditions"),
        backgroundColor: AppColors.secondary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSectionTitle('Terms and Conditions', FontAwesomeIcons.fileContract),
            const SizedBox(height: 20),
            const Text(
              "By using Care Cloud, you agree to comply with these terms and conditions. Please read them carefully.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 30),
            buildSectionTitle('User Agreement', FontAwesomeIcons.users),
            const SizedBox(height: 10),
            const Text(
              "You agree to use Care Cloud in a lawful manner and not misuse the services provided. Any unauthorized or illegal use of the app will result in account termination.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            buildSectionTitle('Data Usage', FontAwesomeIcons.database),
            const SizedBox(height: 10),
            const Text(
              "Care Cloud stores your health-related data on your device. By using the app, you consent to the storage of your personal information for the purpose of using the app's services.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            buildSectionTitle('Limitation of Liability', FontAwesomeIcons.triangleExclamation),
            const SizedBox(height: 10),
            const Text(
              "Care Cloud is not liable for any damages arising from the use or inability to use the app. We do not guarantee the accuracy or completeness of the data stored in the app.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            buildSectionTitle('User Responsibilities', FontAwesomeIcons.userShield),
            const SizedBox(height: 10),
            const Text(
              "As a user, you are responsible for keeping your login credentials secure and ensuring that the information you provide is accurate and up to date.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            buildSectionTitle('Modifications', FontAwesomeIcons.penToSquare),
            const SizedBox(height: 10),
            const Text(
              "We reserve the right to modify these terms at any time. Any changes will be communicated to users through the app or email. Continued use of the app indicates acceptance of these terms.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            buildSectionTitle('Contact Us', FontAwesomeIcons.envelope),
            const SizedBox(height: 10),
            // ignore: prefer_const_constructors
            Row(
              children: const [
                Icon(Icons.email, color: AppColors.primary),
                SizedBox(width: 10),
                Text("connect.carecloud@gmail.com", style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "Thank you for choosing Care Cloud. We are committed to providing you with a secure and efficient health management platform.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            const Text(
              "Version 1.0.0",
              style: TextStyle(color: AppColors.subTitle),
            ),
            const SizedBox(height: 5),
            const Text(
              "© 2024 Care Cloud. All Rights Reserved.",
              style: TextStyle(color: AppColors.subTitle),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title, IconData icon) {
    return Row(
      children: [
        FaIcon(icon, color: AppColors.primary),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}