import 'package:care_cloud/utilities/colors.dart';
import 'package:care_cloud/view/about_us_screen/about_us_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:project_1_carecloud/utilities/colors.dart';
// import 'package:project_1_carecloud/view/about_us_screen/about_us_widget.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        title: const Text("About Us"),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
              
              width: 250,
              height: 250, 
              decoration: const BoxDecoration(
                // color: AppColors.primary,
                image: DecorationImage(
                  image: AssetImage('assets/app_logo/Care Cloud Logo 1 new.png'), // Replace with your app's logo
                  fit: BoxFit.fill, // Adjusts the image to fill the container
                ),
                // borderRadius: BorderRadius.circular(10), // Optional: Rounded corners
              ),
            ),

            const SizedBox(height: 10),
            const Text(
              "Your health, at your fingertips.",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.subTitle,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            
            buildSectionTitle('Our Mission', FontAwesomeIcons.crosshairs),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                "At Care Cloud, our mission is to simplify health management by providing an intuitive platform to store and track your vital medical data, ensuring easy access to critical information anytime, anywhere.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            
            buildSectionTitle('Key Features', FontAwesomeIcons.gear),
            const SizedBox(height: 20),
            buildFeature(Icons.lock, "Securely store medical records."),
            buildFeature(Icons.favorite, "Track vital health statistics."),
            buildFeature(Icons.cloud, "Access your data anytime, anywhere."),
            buildFeature(Icons.security, "Privacy-focused: Local data storage."),
            const SizedBox(height: 30),
            // Vision Section
            buildSectionTitle('Our Vision', FontAwesomeIcons.eye),
            const SizedBox(height: 10),
            const Text(
              "To revolutionize health management by empowering people to take control of their medical data and health records.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // User-Centric Design
            buildSectionTitle('Designed for You', FontAwesomeIcons.users),
            const SizedBox(height: 10),
            const Text(
              "Care Cloud is designed with users in mind, offering a clean, simple UI and user-friendly navigation for all age groups.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // Data Privacy
            buildSectionTitle('Your Data, Your Privacy', FontAwesomeIcons.shieldHalved),
            const SizedBox(height: 10),
            const Text(
              "We prioritize your data's security and privacy. All your medical records are stored locally on your device to ensure that your personal health data remains safe.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // About Developer
            buildSectionTitle('About the Developer', FontAwesomeIcons.laptopCode),
            const SizedBox(height: 10),
            const Text(
              "Care Cloud was developed with the goal of simplifying health management. Behind this project is a passionate developer dedicated to improving user experience through technology.",            
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // Contact Us
            buildSectionTitle('Get in Touch', FontAwesomeIcons.envelope),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email, color: AppColors.primary),
                SizedBox(width: 10),
                Text("connect.carecloud@gmail.com", style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 30),
            // Footer: App Version and Copyright
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

}
