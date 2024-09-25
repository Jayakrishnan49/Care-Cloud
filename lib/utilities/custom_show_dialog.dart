import 'package:care_cloud/utilities/colors.dart';
import 'package:care_cloud/utilities/custombutton.dart';
import 'package:flutter/material.dart';


class CustomShowDialog extends StatelessWidget {
  final String title;
  final String? buttonLeft;
  final String? buttonRight;
  final String subTitle;
  final Icon icon;
  final VoidCallback onTap;
  const CustomShowDialog({
    super.key,
    required this.title,
    this.buttonLeft,
    this.buttonRight,
    required this.subTitle,
    required this.icon,
    required this.onTap,

    });

  @override
  Widget build(BuildContext context) {
   
                              return AlertDialog(
                                title:  Row( 
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    icon,
                                    SizedBox(width: 8,),
                                    Text(
                                      title,
                                      style: const TextStyle(
                                          color: AppColors.primary,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                                content:  Text(
                                  subTitle,
                                  textAlign: TextAlign.center,
                                ),
                                actions: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomButton(
                                          text:buttonLeft ?? 'Cancel',
                                          width: 100,
                                          height: 45,
                                          color: AppColors.subTitle,
                                          textColor: AppColors.title,
                                          borderRadius: 10,
                                          borderColor: AppColors.subTitle,
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        CustomButton(
                                          text:buttonRight ?? 'Delete',
                                          width: 100,
                                          height: 45,
                                          textColor: AppColors.secondary,
                                          color: Colors.red,
                                          borderRadius: 10,
                                          borderColor: Colors.red,
                                          onTap: 
                                           onTap
                                          
                                        )
                                      ])
                                ],
                              );
                            
                          
  }
}




// import 'package:flutter/material.dart';
// import 'package:project_1_carecloud/utilities/colors.dart';
// import 'package:project_1_carecloud/utilities/custombutton.dart';

// class CustomShowDialog {
//   static void show({
//     required BuildContext context,
//     required String title,
//     required String subTitle,
//     required Icon icon,
//     required VoidCallback onTap,
//   }) {
//     @override
//     Widget build(BuildContext context){
//         return AlertDialog(
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               icon, // Displaying the icon
//               const SizedBox(width: 8), // Space between the icon and text
//               Text(
//                 title,
//                 style: TextStyle(
//                   color: AppColors.primary, // Using AppColors for title
//                   fontSize: 20,
//                 ),
//               ),
//             ],
//           ),
//           content: Text(
//             subTitle,
//             textAlign: TextAlign.center,
//           ),
//           actions: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CustomButton(
//                   text: 'Cancel',
//                   width: 100,
//                   height: 45,
//                   color: AppColors.subTitle, // Using AppColors for Cancel button
//                   textColor: AppColors.title, // Using AppColors for Cancel text
//                   borderRadius: 10,
//                   borderColor: AppColors.subTitle,
//                   onTap: () {
//                     Navigator.of(context).pop(); // Close dialog on Cancel
//                   },
//                 ),
//                 const SizedBox(width: 20),
//                 CustomButton(
//                   text: 'Delete',
//                   width: 100,
//                   height: 45,
//                   textColor: AppColors.secondary, // AppColors for Delete text
//                   color: Colors.red, // Keep Delete button red as per your design
//                   borderRadius: 10,
//                   borderColor: Colors.red, // Keeping red border for Delete
//                   onTap: onTap, // Call the passed onTap callback for Delete
//                 ),
//               ],
//             ),
//           ],
//         );
      
    
//   }
// }
// }




// import 'package:flutter/material.dart';
// import 'package:project_1_carecloud/utilities/colors.dart';
// import 'package:project_1_carecloud/utilities/custombutton.dart';

// class CustomShowDialog {
//   static void show({
//     required BuildContext context,
//     required String title,
//     required String subTitle,
//     required Icon icon,
//     required VoidCallback onTap,
//   }) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               icon,
//               const SizedBox(width: 8),
//               Text(
//                 title,
//                 style: TextStyle(color: AppColors.primary, fontSize: 20),
//               ),
//             ],
//           ),
//           content: Text(
//             subTitle,
//             textAlign: TextAlign.center,
//           ),
//           actions: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CustomButton(
//                   text: 'Cancel',
//                   width: 100,
//                   height: 45,
//                   color: AppColors.subTitle,
//                   textColor: AppColors.title,
//                   borderRadius: 10,
//                   borderColor: AppColors.subTitle,
//                   onTap: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//                 const SizedBox(width: 20),
//                 CustomButton(
//                   text: 'Delete',
//                   width: 100,
//                   height: 45,
//                   textColor: AppColors.secondary,
//                   color: Colors.red,
//                   borderRadius: 10,
//                   borderColor: Colors.red,
//                   onTap: onTap,
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }
// }


