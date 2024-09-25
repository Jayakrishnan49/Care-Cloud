import 'package:care_cloud/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        title: const Text("Privacy Policy"),
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
            buildSectionTitle('Privacy Policy', FontAwesomeIcons.lock),
            const SizedBox(height: 20),
            const Text(
              "At Care Cloud, we value your privacy. This policy outlines how we collect, use, and protect your information.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 30),
            buildSectionTitle('Information Collection', FontAwesomeIcons.database),
            const SizedBox(height: 10),
            const Text(
              "We collect information when you register on our app, log in, or use various features. This includes your name, email address, and health-related data.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            buildSectionTitle('Data Usage', FontAwesomeIcons.ellipsisH),
            const SizedBox(height: 10),
            const Text(
              "Your data is used to provide a personalized experience, improve our app, and communicate with you regarding updates or features.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            buildSectionTitle('Data Security', FontAwesomeIcons.shieldAlt),
            const SizedBox(height: 10),
            const Text(
              "We implement a variety of security measures to maintain the safety of your personal information. Your data is stored securely and is not shared with third parties without your consent.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            buildSectionTitle('User Rights', FontAwesomeIcons.userShield),
            const SizedBox(height: 10),
            const Text(
              "You have the right to access, modify, or delete your personal data at any time. Please contact us for any inquiries.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            buildSectionTitle('Contact Us', FontAwesomeIcons.envelope),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(Icons.email, color: AppColors.primary),
                SizedBox(width: 10),
                Text("connect.carecloud@gmail.com", style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "Thank you for trusting Care Cloud with your information. We are committed to protecting your privacy.",
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
