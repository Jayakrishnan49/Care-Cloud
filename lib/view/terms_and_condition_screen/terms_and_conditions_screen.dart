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













// import 'package:flutter/material.dart';
// import 'package:project_1_carecloud/utilities/colors.dart';

// class TermsAndConditionsScreen extends StatelessWidget {
//   const TermsAndConditionsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.secondary,
//       appBar: AppBar(
//         backgroundColor: AppColors.secondary,
//         title: const Text('Terms & Conditions'),
//       ),
//       body: const Padding(
//         padding: EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Terms & Conditions',
//                 style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'These terms and conditions apply to the Care Cloud app '
//                 '(hereby referred to as "Application") for mobile devices that was created by '
//                 'Jayakrishnan (hereby referred to as "Service Provider") as a Free service.',
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'Application Usage',
//                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8),
//               Text(
//                 "By downloading or using the Application, you agree to the following terms. Unauthorized copying, modification, or extraction of the Application's source code or intellectual property is prohibited. All intellectual property rights belong to the Service Provider. The Service Provider may modify the Application or introduce charges at any time, with prior communication of any fees. The Application stores and processes personal data you provide, and it is your responsibility to secure your phone and access to the Application. Jailbreaking or rooting your device is discouraged as it may compromise security and affect the Application’s functionality. Some features of the Application require an active internet connection. The Service Provider is not responsible for issues caused by lack of internet access, exhausted data, or charges incurred from your mobile provider. You are responsible for ensuring your device is charged and capable of running the Application. While the Service Provider aims to keep the Application updated and accurate, third-party information is sometimes relied upon. The Service Provider is not liable for any loss resulting from relying solely on the Application. The Application may receive updates, which you must accept to continue usage. The Service Provider reserves the right to discontinue the Application at any time without notice. Upon termination, your rights to use the Application will end, and you must delete it from your device.",
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(height: 16),
              
//               Text(
//                 'Modifications to the Application',
//                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8),
//               Text(
//                 'The Service Provider may periodically update their Terms and Conditions. Therefore, you are advised to review this page regularly for any changes. The Service Provider will notify you of any changes by posting the new Terms and Conditions on this page.',
//                 style: TextStyle(fontSize: 16),
//               ),
              
//               SizedBox(height: 16),
//               Text(
//                 'Contact Us',
//                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8),
//               Text(
//                 'If you have any questions or suggestions about the Terms and Conditions, '
//                 'please do not hesitate to contact the Service Provider at connect.carecloud@gmail.com.',
//                 style: TextStyle(fontSize: 16),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





