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
            Row(
              children: const [
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

  // Helper Method: Build section title with an icon
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











// import 'package:flutter/material.dart';
// import 'package:project_1_carecloud/utilities/colors.dart';

// class PrivacyPolicyScreen extends StatelessWidget {
//   const PrivacyPolicyScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.secondary,
//       appBar: AppBar(
//         backgroundColor: AppColors.secondary,
//         title: const Text('Privacy Policy'),
//       ),
//       body: const SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Privacy Policy',
//               style: TextStyle(
//                 fontSize: 35,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 30),
//             Text(
//               'This privacy policy applies to the Care Cloud app (hereby referred to as "Application") for mobile devices that was created by Jayakrishnan (hereby referred to as "Service Provider") as a Free service. This service is intended for use by "AS IS".',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Information Collection and Use',
//               style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 15),
//             Text(
//               'The Application collects information when you download and use it. This information may include details such as your device\'s IP address, the pages you visit, the time and date of your visit, and the operating system you use.',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'The Application does not gather precise information about your location. The Service Provider may use the information you provide to contact you for important information or marketing promotions.',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Third Party Access',
//               style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 15),
//             Text(
//               'Aggregated, anonymized data may be transmitted to external services to improve the Application. The Service Provider may disclose your information to third parties as required by law or to protect their rights and your safety.',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Opt-Out Rights',
//               style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 5),
//             Text(
//               'You can stop all collection of information by uninstalling the Application. Use the standard uninstall processes available as part of your device or app marketplace.',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Data Retention Policy',
//               style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 5),
//             Text(
//               'The Service Provider retains user data for as long as the Application is used and for a reasonable time thereafter. To request data deletion, contact connect.carecloud@gmail.com.',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Children',
//               style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 5),
//             Text(
//               "The Service Provider does not knowingly solicit data from or market to children under 13, nor do they knowingly collect personally identifiable information from children. Children are encouraged never to submit any personally identifiable information through the Application or Services. The Service Provider advises parents and legal guardians to monitor their children's Internet usage and help enforce this Policy by instructing their children not to provide personally identifiable information without permission. If you believe a child has provided such information, please contact the Service Provider at connect.carecloud@gmail.com so appropriate action can be taken. In addition, you must be at least 16 years old to consent to the processing of your personally identifiable information in your country, though in some cases, a parent or guardian may provide consent on your behalf.",
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Security',
//               style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 5),
//             Text(
//               'The Service Provider is concerned about safeguarding the confidentiality of your information. The Service Provider provides physical, electronic, and procedural safeguards to protect information the Service Provider processes and maintains',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Changes',
//               style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 5),
//             Text(
//               'This Privacy Policy may be updated from time to time for any reason. The Service Provider will notify you of any changes to the Privacy Policy by updating this page with the new Privacy Policy. You are advised to consult this Privacy Policy regularly for any changes, as continued use is deemed approval of all changes.',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Your Consent',
//               style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 5),
//             Text(
//               'By using the Application, you are consenting to the processing of your information as set forth in this Privacy Policy now and as amended by us.',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Contact Us',
//               style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 5),
//             Text(
//               'If you have any questions regarding privacy while using the Application, or have questions about the practices, please contact the Service Provider via email at connect.carecloud@gmail.com.',
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
