// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:project_1_carecloud/model/add_account_db/add_account_db.dart';
// import 'package:project_1_carecloud/view/privacy_policy_screen/privacy_policy_screen.dart';
// import 'package:project_1_carecloud/view/settings_screen/settings_screen.dart';
// import 'package:project_1_carecloud/utilities/colors.dart';
// import 'package:project_1_carecloud/view/login_screen/login_screen.dart';
// import 'package:project_1_carecloud/view/terms_and_condition_screen/terms_and_conditions_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   void _showDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Logout'),
//           content: const Text('Are you sure you want to logout?'),
//           actions: [
//             TextButton(
//               onPressed: () async {
//                 final sharedprefs = await SharedPreferences.getInstance();
//                 await sharedprefs.setBool('key', false);
//                 Navigator.pushAndRemoveUntil(
//                   // ignore: use_build_context_synchronously
//                   context,
//                   MaterialPageRoute(builder: (context) => const LoginScreen()),
//                   (Route<dynamic> route) => false,
//                 );
//               },
//               child: const Text('Yes'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('No'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<Sample> tileItems = [
//       Sample(
//         "Settings",
//         const FaIcon(FontAwesomeIcons.gear),
//         () {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => const SettingsScreen()));
//         },
//       ),
//       // Sample(
//       //   "Info",
//       //   const FaIcon(FontAwesomeIcons.circleInfo),
//       //   () {},
//       // ),
//       Sample(
//         "Privacy Policy", 
//         const FaIcon(FontAwesomeIcons.fileCircleCheck), 
//         (){
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen()));
//         }),
//         Sample(
//         "Terms & Conditions", 
//         const FaIcon(FontAwesomeIcons.penNib), 
//         (){
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) =>  const TermsAndConditionsScreen()));
//         }),
//       Sample(
//         "Logout",
//         const FaIcon(
//           FontAwesomeIcons.arrowRightFromBracket,
//           color: Colors.red,
//         ),
//         () {
//           _showDialog();
//         },
//       ),
//     ];

//     return ValueListenableBuilder(
//         valueListenable: Hive.box<ProfileDb>('profileBox').listenable(),
//         builder: (context, box, child) {
//           var data = box.values.toList().cast<ProfileDb>();
//           return Scaffold(
//             backgroundColor: AppColors.primary,
//             body: Center(
//               child: SafeArea(
//                 child: Column(
//                   children: [
//                     Container(
//                       width: 150.0, // Adjust the size as needed
//                       height: 150.0,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(
//                           color: AppColors.secondary, // Outline color
//                           width: 3.0, // Outline width
//                         ),
//                       ),
//                       child: CircleAvatar(
//                         foregroundColor: AppColors.secondary,
//                         radius: 200,
//                         backgroundImage: FileImage(File(data.last.image)),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Text(
//                       data.last.username,
//                       style: const TextStyle(
//                           fontSize: 20, color: AppColors.secondary),
//                     ),
//                     const SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Expanded(
//                           child: Column(
//                             children: [
//                               const FaIcon(
//                                 FontAwesomeIcons.person,
//                                 color: AppColors.secondary,
//                               ),
//                               const SizedBox(height: 8),
//                               const Text(
//                                 'Gender',
//                                 style: TextStyle(color: AppColors.secondary),
//                               ),
//                               const SizedBox(height: 4),
//                               Text(data.last.gender,
//                                   style: const TextStyle(
//                                       color: AppColors.secondary)),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           height: 60,
//                           width: 2,
//                           color: AppColors.secondary,
//                         ),
//                         Expanded(
//                           child: Column(
//                             children: [
//                               const FaIcon(
//                                 FontAwesomeIcons.calendar,
//                                 color: AppColors.secondary,
//                               ),
//                               const SizedBox(height: 8),
//                               const Text(
//                                 'Age',
//                                 style: TextStyle(color: AppColors.secondary),
//                               ),
//                               const SizedBox(height: 4),
//                               Text(data.last.age,
//                                   style: const TextStyle(
//                                       color: AppColors.secondary)),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     Expanded(
//                       child: Container(
//                         width: double.infinity,
//                         decoration: const BoxDecoration(
//                           color: AppColors.secondary,
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(50),
//                             topRight: Radius.circular(50),
//                           ),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: ListView.builder(
//                             itemBuilder: (context, index) {
//                               return InkWell(
//                                 onTap: tileItems[index].onTap,
//                                 child: ListTile(
//                                   leading: tileItems[index].icons,
//                                   title: Text(
//                                     tileItems[index].name!,
//                                     style: const TextStyle(fontSize: 20),
//                                   ),
//                                 ),
//                               );
//                             },
//                             itemCount: tileItems.length,
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }
// }

// class Sample {
//   String? name;
//   FaIcon? icons;
//   VoidCallback onTap;

//   Sample(this.name, this.icons, this.onTap);
// }
