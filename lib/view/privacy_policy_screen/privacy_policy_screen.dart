// import 'package:care_cloud/utilities/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';


// class PrivacyPolicyScreen extends StatelessWidget {
//   const PrivacyPolicyScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.secondary,
//       appBar: AppBar(
//         title: const Text("Privacy Policy"),
//         backgroundColor: AppColors.secondary,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             buildSectionTitle('Privacy Policy', FontAwesomeIcons.lock),
//             const SizedBox(height: 20),
//             const Text(
//               "At Care Cloud, we value your privacy. This policy outlines how we collect, use, and protect your information.",
//               style: TextStyle(fontSize: 16),
//               textAlign: TextAlign.left,
//             ),
//             const SizedBox(height: 30),
//             buildSectionTitle('Information Collection', FontAwesomeIcons.database),
//             const SizedBox(height: 10),
//             const Text(
//               "We collect information when you register on our app, log in, or use various features. This includes your name, email address, and health-related data.",
//               style: TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 30),
//             buildSectionTitle('Data Usage', FontAwesomeIcons.ellipsis),
//             const SizedBox(height: 10),
//             const Text(
//               "Your data is used to provide a personalized experience, improve our app, and communicate with you regarding updates or features.",
//               style: TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 30),
//             buildSectionTitle('Data Security', FontAwesomeIcons.shieldAlt),
//             const SizedBox(height: 10),
//             const Text(
//               "We implement a variety of security measures to maintain the safety of your personal information. Your data is stored securely and is not shared with third parties without your consent.",
//               style: TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 30),
//             buildSectionTitle('User Rights', FontAwesomeIcons.userShield),
//             const SizedBox(height: 10),
//             const Text(
//               "You have the right to access, modify, or delete your personal data at any time. Please contact us for any inquiries.",
//               style: TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 30),
//             buildSectionTitle('Contact Us', FontAwesomeIcons.envelope),
//             const SizedBox(height: 10),
//             const Row(
//               children: [
//                 Icon(Icons.email, color: AppColors.primary),
//                 SizedBox(width: 10),
//                 Text("connect.carecloud@gmail.com", style: TextStyle(fontSize: 16)),
//               ],
//             ),
//             const SizedBox(height: 30),
//             const Text(
//               "Thank you for trusting Care Cloud with your information. We are committed to protecting your privacy.",
//               style: TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 30),
//             const Text(
//               "Version 1.0.0",
//               style: TextStyle(color: AppColors.subTitle),
//             ),
//             const SizedBox(height: 5),
//             const Text(
//               "© 2024 Care Cloud. All Rights Reserved.",
//               style: TextStyle(color: AppColors.subTitle),
//             ),
//             const SizedBox(height: 30),
//           ],
//         ),
//       ),
//     );
//   }
//   Widget buildSectionTitle(String title, IconData icon) {
//     return Row(
//       children: [
//         FaIcon(icon, color: AppColors.primary),
//         const SizedBox(width: 10),
//         Text(
//           title,
//           style: const TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: AppColors.primary,
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:care_cloud/utilities/colors.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy',style: TextStyle(color: AppColors.secondary),),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Privacy Policy",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Last updated: September 30, 2024",
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 20),
            _buildSectionTitle('Introduction'),
            _buildPolicyText(
                "This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You. We use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. This Privacy Policy has been created with the help of the Privacy Policy Generator."),
            SizedBox(height: 20),
            _buildSectionTitle('Interpretation and Definitions'),
            _buildPolicyText(
                "The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural."),
            SizedBox(height: 20),
            _buildSectionTitle('Definitions'),
            _buildPolicyText(
                "For the purposes of this Privacy Policy: \n• Account means a unique account created for You to access our Service or parts of our Service."),
            SizedBox(height: 10),
            _buildPolicyText("• Affiliate means an entity that controls, is controlled by or is under common control with a party, where 'control' means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority."),
            SizedBox(height: 10),
            _buildPolicyText("• Application refers to Care Cloud, the software program provided by the Company."),
            SizedBox(height: 10),
            _buildPolicyText("• Company (referred to as either 'the Company', 'We', 'Us' or 'Our' in this Agreement) refers to Care Cloud."),
            SizedBox(height: 10),
            _buildPolicyText("• Country refers to: Kerala, India"),
            SizedBox(height: 10),
            _buildPolicyText("• Device means any device that can access the Service such as a computer, a cellphone or a digital tablet."),
            SizedBox(height: 10),
            _buildPolicyText("• Personal Data is any information that relates to an identified or identifiable individual."),
            SizedBox(height: 10),
            _buildPolicyText("• Service refers to the Application."),
            SizedBox(height: 10),
            _buildPolicyText("• Service Provider means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used."),
            SizedBox(height: 10),
            _buildPolicyText("• Usage Data refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit)."),
            SizedBox(height: 20),
            _buildSectionTitle('Types of Data Collected'),
            _buildPolicyText("Personal Data and Usage Data..."),
            SizedBox(height: 20),
            _buildSectionTitle('Collecting and Using Your Personal Data'),
            _buildPolicyText(
                "While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:\n\n• First name and last name\n• Phone number\n• Address, State, Province, ZIP/Postal code, City"),
            SizedBox(height: 20),
            _buildSectionTitle('Usage Data'),
            _buildPolicyText(
                "Usage Data is collected automatically when using the Service.\n\nUsage Data may include information such as Your Device's Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that You visit, the time and date of Your visit, the time spent on those pages, unique device identifiers and other diagnostic data.\n\nWhen You access the Service by or through a mobile device, We may collect certain information automatically, including, but not limited to, the type of mobile device You use, Your mobile device unique ID, the IP address of Your mobile device, Your mobile operating system, the type of mobile Internet browser You use, unique device identifiers and other diagnostic data."),
            SizedBox(height: 20),
            _buildSectionTitle('Information Collected while Using the Application'),
            _buildPolicyText(
                "While using Our Application, in order to provide features of Our Application, We may collect, with Your prior permission:\n\n• Pictures and other information from your Device's camera and photo library.\n\nWe use this information to provide features of Our Service, to improve and customize Our Service. The information may be uploaded to the Company's servers and/or a Service Provider's server or it may be simply stored on Your device.\n\nYou can enable or disable access to this information at any time, through Your Device settings."),
            SizedBox(height: 20),
            _buildSectionTitle('Use of Your Personal Data'),
            _buildPolicyText(
                "The Company may use Personal Data for the following purposes:\n\n• To provide and maintain our Service, including to monitor the usage of our Service.\n• To manage Your Account: to manage Your registration as a user of the Service. The Personal Data You provide can give You access to different functionalities of the Service that are available to You as a registered user.\n• For the performance of a contract: the development, compliance and undertaking of the purchase contract for the products, items or services You have purchased or of any other contract with Us through the Service.\n• To contact You: To contact You by email, telephone calls, SMS, or other equivalent forms of electronic communication, such as a mobile application's push notifications regarding updates or informative communications related to the functionalities, products or contracted services, including the security updates, when necessary or reasonable for their implementation.\n• To provide You with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless You have opted not to receive such information.\n• To manage Your requests: To attend and manage Your requests to Us.\n• For business transfers: We may use Your information to evaluate or conduct a merger, divestiture, restructuring, reorganization, dissolution, or other sale or transfer of some or all of Our assets, whether as a going concern or as part of bankruptcy, liquidation, or similar proceeding, in which Personal Data held by Us about our Service users is among the assets transferred.\n• For other purposes: We may use Your information for other purposes, such as data analysis, identifying usage trends, determining the effectiveness of our promotional campaigns and to evaluate and improve our Service, products, services, marketing and your experience."),
            SizedBox(height: 20),
            _buildSectionTitle('Disclosure of Your Personal Data'),
            _buildPolicyText(
                "The Company may share Your personal information in the following situations:\n\n• With Service Providers: We may share Your personal information with Service Providers to monitor and analyze the use of our Service, to contact You.\n• For business transfers: We may share or transfer Your personal information in connection with, or during negotiations of, any merger, sale of Company assets, financing, or acquisition of all or a portion of Our business to another company.\n• With Affiliates: We may share Your information with Our affiliates, in which case we will require those affiliates to honor this Privacy Policy. Affiliates include Our parent company and any other subsidiaries, joint venture partners or other companies that We control or that are under common control with Us.\n• With business partners: We may share Your information with Our business partners to offer You certain products, services or promotions.\n• With other users: when You share personal information or otherwise interact in the public areas with other users, such information may be viewed by all users and may be publicly distributed outside.\n• With Your consent: We may disclose Your personal information for any other purpose with Your consent."),
            SizedBox(height: 20),
            _buildSectionTitle('Retention of Your Personal Data'),
            _buildPolicyText(
                "The Company will retain Your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use Your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies.\n\nThe Company will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period of time, except when this data is used to strengthen the security or to improve the functionality of our Service, or we are legally obligated to retain this data for longer time periods."),
            SizedBox(height: 20),
            _buildSectionTitle('Transfer of Your Personal Data'),
            _buildPolicyText(
                "Your information, including Personal Data, may be transferred to — and maintained on — computers located outside of Your state, province, country or other governmental jurisdiction where the data protection laws may differ from those of Your jurisdiction.\n\nIf You are located outside India and choose to provide information to Us, please note that we transfer the data, including Personal Data, to India and process it there.\n\nYour consent to this Privacy Policy followed by Your submission of such information represents Your agreement to that transfer.\n\nThe Company will take all steps reasonably necessary to ensure that Your data is treated securely and in accordance with this Privacy Policy and no transfer of Your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of Your data and other personal information."),
            SizedBox(height: 20),
            _buildSectionTitle('Delete Your Personal Data'),
            _buildPolicyText(
                "You have the right to delete or request that We assist in deleting the Personal Data that We have collected about You.\n\nYou can delete Your Personal Data by:\n\n• By contacting Us directly.\n\nPlease note that we may ask You to verify Your identity before responding to such requests."),
            SizedBox(height: 20),
            _buildSectionTitle('Security of Your Personal Data'),
            _buildPolicyText(
                "The security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While we strive to use commercially acceptable means to protect Your Personal Data, we cannot guarantee its absolute security."),
            SizedBox(height: 20),
            _buildSectionTitle("Children's Privacy"),
            _buildPolicyText(
                "Our Service does not address anyone under the age of 13. We do not knowingly collect personally identifiable information from anyone under the age of 13. If You are a parent or guardian and You are aware that Your child has provided Us with Personal Data, please contact Us. If We become aware that We have collected Personal Data from anyone under the age of 13 without verification of parental consent, We take steps to remove that information from Our servers.\n\nIf We need to rely on consent as a legal basis for processing Your information and Your country requires consent from a parent, We may require Your parent's consent before We collect and use that information."),
            SizedBox(height: 20),
            _buildSectionTitle('Links to Other Websites'),
            _buildPolicyText(
                "Our Service may contain links to other websites that are not operated by Us. If You click on a third party link, You will be directed to that third party's site. We strongly advise You to review the Privacy Policy of every site You visit.\n\nWe have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services."),
            SizedBox(height: 20),
            _buildSectionTitle('Changes to this Privacy Policy'),
            _buildPolicyText(
                "We may update Our Privacy Policy from time to time. We will notify You of any changes by posting the new Privacy Policy on this page.\n\nWe will let You know via email and/or a prominent notice on Our Service, prior to the change becoming effective and update the 'Last updated' date at the top of this Privacy Policy.\n\nYou are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page."),
            SizedBox(height: 20),
            _buildSectionTitle('Contact Us'),
            _buildPolicyText(
                "If you have any questions about this Privacy Policy, You can contact us:\n\nBy email: connect.carecloud@gmail.com"),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildPolicyText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, color: Colors.black54),
    );
  }
}
