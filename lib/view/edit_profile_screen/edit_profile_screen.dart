// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:project_1_carecloud/model/add_account_db/add_account_db.dart';
// import 'package:project_1_carecloud/utilities/colors.dart';
// import 'package:project_1_carecloud/utilities/customTextfornField.dart';
// import 'package:project_1_carecloud/utilities/custombutton.dart';

// class EditProfileScreen extends StatefulWidget {
//   const EditProfileScreen({super.key});

//   @override
//   State<EditProfileScreen> createState() => _EditProfileScreenState();
// }
// class _EditProfileScreenState extends State<EditProfileScreen> {
//   String _selectedGender = '';
//   String? image;
//   String? newImagePath;
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: Hive.box<ProfileDb>('profileBox').listenable(),
//       builder: (context, box, child) {
//         var data = box.values.toList().cast<ProfileDb>();

//         return Scaffold(
//           backgroundColor: AppColors.secondary,
//           appBar: AppBar(
//             backgroundColor: AppColors.secondary,
//             title: const Text('Edit Profile'),
//           ),
//           body: SafeArea(
//             child: SingleChildScrollView(
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     Column(
//                       children: [
//                         Stack(
//                           children: [
//                             Container(
//                               width: 170.0,
//                               height: 170.0,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 border: Border.all(
//                                   color: AppColors.primary,
//                                   width: 3.0,
//                                 ),
//                               ),
//                               child: CircleAvatar(
//                                 foregroundColor: AppColors.primary,
//                                 radius: 200,
//                                 backgroundImage: FileImage(
//                                   File(newImagePath ?? data.last.image),
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                               bottom: 5,
//                               right: 5,
//                               child: InkWell(
//                                 child: Container(
//                                   width: 50,
//                                   height: 50,
//                                   decoration: BoxDecoration(
//                                     color: AppColors.primary,
//                                     borderRadius: BorderRadius.circular(100),
//                                   ),
//                                   child: const Icon(
//                                     Icons.camera_alt_outlined,
//                                     size: 30,
//                                     color: AppColors.secondary,
//                                   ),
//                                 ),
//                                 onTap: () {
//                                   showModalBottomSheet(
//                                       context: context,
//                                       builder: (context) {
//                                         return SizedBox(
//                                           height: 120,
//                                           width: double.infinity,
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceAround,
//                                             children: [
//                                               IconButton(
//                                                   onPressed: () {
//                                                     cameraImage();
//                                                     Navigator.pop(context);
//                                                   },
//                                                   icon: const Icon(
//                                                     Icons.camera,
//                                                     size: 50,
//                                                   )),
//                                               IconButton(
//                                                   onPressed: () {
//                                                     galleryImage();
//                                                     Navigator.pop(context);
//                                                   },
//                                                   icon: const Icon(
//                                                     Icons.image,
//                                                     size: 50,
//                                                   ))
//                                             ],
//                                           ),
//                                         );
//                                       }
//                                       );
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(30.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(height: 25),
//                           CustomTextFormField(
//                             initialValue: data.last.username,
//                             labelText: 'Your Name',
//                             hintText: 'Enter your name',
//                             borderRadius: 10,
//                             validator: (value) {
//                               if (value == null || value.trim().isEmpty) {
//                                 return 'Enter name';
//                               } else {
//                                 return null;
//                               }
//                             },
//                             onSaved: (value) {
//                               data.last.username = value.toString();
//                             },
//                           ),
//                           const SizedBox(height: 20),
//                           CustomTextFormField(
//                             initialValue: data.last.phoneno,
//                             keyboardType: TextInputType.number,
//                             labelText: 'Phone Number',
//                             hintText: 'Enter your phone number',
//                             borderRadius: 10,
//                             validator: (value) {
//                               if (value == null || value.trim().isEmpty) {
//                                 return 'Enter phone number';
//                               } else {
//                                 return null;
//                               }
//                             },
//                             onSaved: (value) {
//                               data.last.phoneno = value!;
//                             },
//                           ),
//                           const SizedBox(height: 20),
//                           const Align(
//                             alignment: Alignment.centerLeft,
//                             child: Padding(
//                               padding: EdgeInsets.only(left: 8),
//                               child: Text('Gender'),
//                             ),
//                           ),
//                           const SizedBox(height: 15),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               CustomButton(
//                                 text: 'Male',
//                                 color: _selectedGender == 'Male'
//                                     ? AppColors.primary
//                                     : Colors.white,
//                                 textColor: _selectedGender == 'Male'
//                                     ? Colors.white
//                                     : Colors.black,
//                                 width: 100,
//                                 icon: const Icon(Icons.male),
//                                 borderRadius: 10,
//                                 onTap: () {
//                                   setState(() {
//                                     _selectedGender = 'Male';
//                                     data.last.gender = 'Male';
//                                   });
//                                 },
//                               ),
//                               CustomButton(
//                                 text: 'Female',
//                                 color: _selectedGender == 'Female'
//                                     ? AppColors.primary
//                                     : Colors.white,
//                                 textColor: _selectedGender == 'Female'
//                                     ? Colors.white
//                                     : Colors.black,
//                                 width: 115,
//                                 icon: const Icon(Icons.female),
//                                 borderRadius: 10,
//                                 onTap: () {
//                                   setState(() {
//                                     _selectedGender = 'Female';
//                                     data.last.gender = 'Female';
//                                   });
//                                 },
//                               ),
//                               CustomButton(
//                                 text: 'Others',
//                                 color: _selectedGender == 'Others'
//                                     ? AppColors.primary
//                                     : Colors.white,
//                                 textColor: _selectedGender == 'Others'
//                                     ? Colors.white
//                                     : Colors.black,
//                                 width: 100,
//                                 borderRadius: 10,
//                                 onTap: () {
//                                   setState(() {
//                                     _selectedGender = 'Others';
//                                     data.last.gender = 'Others';
//                                   });
//                                 },
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 25),
//                           CustomTextFormField(
//                             initialValue: data.last.age,
//                             keyboardType: TextInputType.number,
//                             hintText: 'Enter your age e.g., 25',
//                             labelText: 'Age',
//                             width: 150,
//                             borderRadius: 10,
//                             validator: (value) {
//                               if (value == null || value.trim().isEmpty) {
//                                 return 'Enter your age';
//                               } else {
//                                 return null;
//                               }
//                             },
//                             onSaved: (value) {
//                               data.last.age = value!;
//                             },
//                           ),
//                           const SizedBox(height: 25),
//                           const Text(
//                             'Your Address',
//                             style: TextStyle(fontSize: 25),
//                           ),
//                           const SizedBox(height: 20),
//                           CustomTextFormField(
//                             initialValue: data.last.address,
//                             labelText: 'Address',
//                             hintText: 'Enter your address here',
//                             borderRadius: 10,
//                             height: 150,
//                             onSaved: (value) {
//                               data.last.address = value!;
//                             },
//                           ),
//                           const SizedBox(height: 20),
//                           CustomTextFormField(
//                             initialValue: data.last.pincode,
//                             keyboardType: TextInputType.number,
//                             labelText: 'Pincode',
//                             borderRadius: 10,
//                             onSaved: (value) {
//                               data.last.pincode = value!;
//                             },
//                           ),
//                           const SizedBox(height: 20),
//                           CustomTextFormField(
//                             initialValue: data.last.city,
//                             labelText: 'City',
//                             borderRadius: 10,
//                             onSaved: (value) {
//                               data.last.city = value!;
//                             },
//                           ),
//                           const SizedBox(height: 50),
//                           CustomButton(
//                             text: 'Save',
//                             width: 350,
//                             borderRadius: 10,
//                             onTap: () {
//                               if (_formKey.currentState!.validate()) {
//                                 _formKey.currentState!.save();
//                                 if (newImagePath != null) {
//                                   data.last.image = newImagePath!;
//                                 }

//                                 data.last.save();

//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                   content:
//                                       Text('Profile updated successfully'),
//                                   behavior: SnackBarBehavior.floating,
//                                   backgroundColor: Colors.green,
//                                   margin: EdgeInsets.all(20),
//                                   duration: Duration(seconds: 3),
//                                   showCloseIcon: true,
//                                 ),
//                                 );
//                               }
//                             },
//                           ),
//                           const SizedBox(height: 20),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Future galleryImage() async {
//     final imageTaken =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (imageTaken != null) {
//       setState(() {
//         newImagePath = imageTaken.path;
//       });
//     }
//   }

//   Future cameraImage() async {
//     final imageTaken =
//         await ImagePicker().pickImage(source: ImageSource.camera);
//     if (imageTaken != null) {
//       setState(() {
//         newImagePath = imageTaken.path; //
//       });
//     }
//   }
// }
