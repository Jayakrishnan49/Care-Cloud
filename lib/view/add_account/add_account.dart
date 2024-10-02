// import 'dart:io';

// import 'package:care_cloud/controller/profile_fn.dart';
// import 'package:care_cloud/model/add_account_db/add_account_db.dart';
// import 'package:care_cloud/utilities/colors.dart';
// import 'package:care_cloud/utilities/customTextfornField.dart';
// import 'package:care_cloud/utilities/custom_camera_gallery_bottom_sheet.dart';
// import 'package:care_cloud/utilities/custombutton.dart';
// import 'package:care_cloud/view/homepage_screen/homepage_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AddAccount extends StatefulWidget {
//   const AddAccount({super.key});

//   @override
//   State<AddAccount> createState() => _AddAccountState();
// }

// class _AddAccountState extends State<AddAccount> {
//   final ProfileDetails _profileDetails = ProfileDetails();

//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _phnoController = TextEditingController();
//   final TextEditingController _ageController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _pincodeController = TextEditingController();
//   final TextEditingController _cityController = TextEditingController();
//   final _formkey = GlobalKey<FormState>();

//   String _selectedGender = '';
//   String? image;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.secondary,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formkey,
//             child: Column(
//               children: [
//                 Column(
//                   children: [
//                     const Text(
//                       'Complete Your Profile',
//                       style: TextStyle(fontSize: 30),
//                     ),
//                     const Text(
//                       'Add your details',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                     const SizedBox(height: 20),
//                     Stack(
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(100),
//                           child: Container(
//                             height: 150,
//                             width: 150,
//                             color: AppColors.subTitle,
//                             child: image != null
//                                 ? Image.file(File(image!),fit:BoxFit.fill ,)
//                                 : const Center(
//                                     child: Icon(
//                                       Icons.person,
//                                       size: 130,
//                                     ),
//                                   ),
//                           ),
//                         ),
//                         Positioned(
//                           bottom: 5,
//                           right: 5,
//                           child: InkWell(
//                             child: Container(
//                               width: 50,
//                               height: 50,
//                               decoration: BoxDecoration(
//                                 color: AppColors.primary,
//                                 borderRadius: BorderRadius.circular(100),
//                               ),
//                               child: const Icon(
//                                 Icons.camera_alt_outlined,
//                                 size: 30,
//                                 color: AppColors.secondary,
//                               ),
//                             ),
//                             onTap: () {
//                               showModalBottomSheet(
//                                   context: context,
//                                   builder: (context) {
                                    
//                                     return CustomCameraGalleryBottomSheet(
//                                 onImagePicked: (imagePath) {
//                               setState(() {
//                                 image = imagePath;
//                               });
//                             });
//                                   }
//                                   );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(30.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(height: 25),
//                       CustomTextFormField(
//                         controller: _usernameController,
//                         labelText: 'Your Name',
//                         hintText: 'Enter your name',
//                         borderRadius: 10,
//                         validator: (value) {
//                           if (value == null || value.trim().isEmpty) {
//                             return 'Enter name';
//                           } else {
//                             return null;
//                           }
//                         },
//                       ),
//                       const SizedBox(height: 20),
//                       CustomTextFormField(
//                         controller: _phnoController,
//                         keyboardType: TextInputType.number,
//                         labelText: 'Phone Number',
//                         hintText: 'Enter your phone number',
//                         borderRadius: 10,
//                         validator: (value) {
//                           if (value == null || value.trim().isEmpty) {
//                             return 'Enter phone number';
//                           } else {
//                             return null;
//                           }
//                         },
//                       ),
//                       const SizedBox(height: 20),
//                       const Align(
//                         alignment: Alignment.centerLeft,
//                         child: Padding(
//                           padding: EdgeInsets.only(left: 8),
//                           child: Text('Gender'),
//                         ),
//                       ),
//                       const SizedBox(height: 15),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           CustomButton(
//                             text: 'Male',
//                             color: _selectedGender == 'Male'
//                                 ? AppColors.primary
//                                 : Colors.white,
//                             textColor: _selectedGender == 'Male'
//                                 ? Colors.white
//                                 : Colors.black,
//                             width: 100,
//                             icon: const Icon(Icons.male),
//                             borderRadius: 10,
//                             onTap: () {
//                               setState(() {
//                                 _selectedGender = 'Male';
//                               });
//                             },
//                           ),
//                           CustomButton(
//                             text: 'Female',
//                             color: _selectedGender == 'Female'
//                                 ? AppColors.primary
//                                 : Colors.white,
//                             textColor: _selectedGender == 'Female'
//                                 ? Colors.white
//                                 : Colors.black,
//                             width: 115,
//                             icon: const Icon(Icons.female),
//                             borderRadius: 10,
//                             onTap: () {
//                               setState(() {
//                                 _selectedGender = 'Female';
//                               });
//                             },
//                           ),
//                           CustomButton(
//                             text: 'Others',
//                             color: _selectedGender == 'Others'
//                                 ? AppColors.primary
//                                 : Colors.white,
//                             textColor: _selectedGender == 'Others'
//                                 ? Colors.white
//                                 : Colors.black,
//                             width: 100,
//                             borderRadius: 10,
//                             onTap: () {
//                               setState(() {
//                                 _selectedGender = 'Others';
//                               });
//                             },
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 25),
//                       CustomTextFormField(
//                         controller: _ageController,
//                         keyboardType: TextInputType.number,
//                         hintText: 'Enter your age e.g., 25',
//                         labelText: 'Age',
//                         width: 150,
//                         borderRadius: 10,
//                         validator: (value) {
//                           if (value == null || value.trim().isEmpty) {
//                             return 'Enter your age';
//                           } else {
//                             return null;
//                           }
//                         },
//                       ),
//                       const SizedBox(height: 25),
//                       const Text(
//                         'Your Address',
//                         style: TextStyle(fontSize: 25),
//                       ),
//                       const SizedBox(height: 20),
//                       CustomTextFormField(
//                         controller: _addressController,
//                         labelText: 'Address',
//                         hintText: 'Enter your address here',
//                         borderRadius: 10,
//                         height: 150,
//                       ),
//                       const SizedBox(height: 20),
//                       CustomTextFormField(
//                         controller: _pincodeController,
//                         keyboardType: TextInputType.number,
//                         labelText: 'Pincode',
//                         borderRadius: 10,
//                       ),
//                       const SizedBox(height: 20),
//                       CustomTextFormField(
//                         controller: _cityController,
//                         labelText: 'City',
//                         borderRadius: 10,
//                       ),
//                       const SizedBox(height: 50),
//                       CustomButton(
//                         text: 'Save',
//                         width: 350,
//                         borderRadius: 10,
//                         onTap: () async {
//                           if (_formkey.currentState!.validate()) {
//                             if (image == null || image!.isEmpty) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   backgroundColor: Colors.red,
//                                    content: Text("Please add a profile picture"),
//                                 ),
//                               );
//                               // return;
//                             }
//                             if (_selectedGender.isEmpty) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   backgroundColor: Colors.red,
//                                   content: Text("Please select a gender"),
//                                 ),
//                               );
//                               return;
//                             }
//                             _profileDetails.addProfileDetails(ProfileDb(
//                                 username: _usernameController.text,
//                                 phoneno: _phnoController.text,
//                                 gender: _selectedGender,
//                                 age: _ageController.text,
//                                 address: _addressController.text,
//                                 pincode: _pincodeController.text,
//                                 city: _cityController.text,
//                                 image: image!));
//                             final profSharedprefs =
//                                 await SharedPreferences.getInstance();
//                             await profSharedprefs.setBool('profKey', true);
//                             // ignore: use_build_context_synchronously
//                             Navigator.of(context).pushReplacement(
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         const HomepageScreen()));
//                           }
//                         },
//                       ),
//                       const SizedBox(height: 20),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future galleryImage() async {
//     final imageTaken =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (imageTaken == null) {
//       return;
//     } else {
//       setState(() {
//         image = imageTaken.path;
//       });
//     }
//   }

//   Future cameraImage() async {
//     final imageTaken =
//         await ImagePicker().pickImage(source: ImageSource.camera);
//     if (imageTaken == null) {
//       return;
//     } else {
//       setState(() {
//         image = imageTaken.path;
//       });
//     }
//   }
// }
