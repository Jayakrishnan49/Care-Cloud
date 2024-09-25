// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:project_1_carecloud/utilities/colors.dart';

// class CustomCameraGalleryBottomSheet extends StatelessWidget {
//   const CustomCameraGalleryBottomSheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return showModalBottomSheet(
//                       context: context,
//                       builder: (context) {
//                         return SizedBox(
//                           height: 180,
//                           width: double.infinity,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [

//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     // color: AppColors.primary,
//                                     decoration: BoxDecoration(border: Border.all(color: AppColors.subTitle),borderRadius: BorderRadius.circular(100)),
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: IconButton(
//                                         onPressed: () {
//                                           cameraImage();
//                                           Navigator.pop(context);
//                                         },
//                                         // icon: const Icon(Icons.camera_indoor, size: 50),
//                                         icon: FaIcon(FontAwesomeIcons.camera,size: 30,),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(height: 10,),
//                                   Text('Camera',style: TextStyle(fontSize: 15),)
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     decoration: BoxDecoration(border: Border.all(color: AppColors.subTitle),borderRadius: BorderRadius.circular(100)),
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: IconButton(
//                                         onPressed: () {
//                                           galleryImage();
//                                           Navigator.pop(context);
//                                         },
//                                         // icon: const Icon(Icons.image, size: 50),
//                                         icon: FaIcon(FontAwesomeIcons.image,size: 30,),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(height: 10,),
//                                   Text('Gallery',style: TextStyle(fontSize: 15),)
//                                 ],
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     );;
//   }
//   Future galleryImage() async {
//     final imageTaken = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (imageTaken != null) {
//       setState(() {
//         imagePath = imageTaken.path;
//       });
//     }
//   }

//   Future cameraImage() async {
//     final imageTaken = await ImagePicker().pickImage(source: ImageSource.camera);
//     if (imageTaken != null) {
//       setState(() {
//         imagePath = imageTaken.path;
//       });
//     }
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:project_1_carecloud/utilities/colors.dart';

// class CustomCameraGalleryBottomSheet extends StatelessWidget {
//   final VoidCallback onCameraTap;
//   final VoidCallback onGalleryTap;

//   const CustomCameraGalleryBottomSheet({
//     super.key,
//     required this.onCameraTap,
//     required this.onGalleryTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 180,
//       width: double.infinity,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           _buildIconColumn(
//             context: context,
//             icon: FontAwesomeIcons.camera,
//             label: 'Camera',
//             onTap: onCameraTap,
//           ),
//           _buildIconColumn(
//             context: context,
//             icon: FontAwesomeIcons.image,
//             label: 'Gallery',
//             onTap: onGalleryTap,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildIconColumn({
//     required BuildContext context,
//     required IconData icon,
//     required String label,
//     required VoidCallback onTap,
//   }) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             border: Border.all(color: AppColors.subTitle),
//             borderRadius: BorderRadius.circular(100),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: IconButton(
//               onPressed: () {
//                 onTap();
//                 Navigator.pop(context);
//               },
//               icon: FaIcon(icon, size: 30),
//             ),
//           ),
//         ),
//         const SizedBox(height: 10),
//         Text(label, style: const TextStyle(fontSize: 15)),
//       ],
//     );
//   }

//   Future galleryImage() async {
//     final imageTaken = await ImagePicker().pickImage(source: ImageSource.gallery);
    
//   }

//   Future cameraImage() async {
//     final imageTaken = await ImagePicker().pickImage(source: ImageSource.camera);
    
//   }
// }



import 'package:care_cloud/utilities/colors.dart';
import 'package:care_cloud/utilities/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'image_picker_util.dart'; // Import the utility

class CustomCameraGalleryBottomSheet extends StatelessWidget {
  final Function(String) onImagePicked;

  const CustomCameraGalleryBottomSheet({
    super.key,
    required this.onImagePicked,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildIconColumn(
            context: context,
            icon: FontAwesomeIcons.camera,
            label: 'Camera',
            onTap: () async {
              String? imagePath = await ImagePickerUtil.pickImageFromCamera();
              if (imagePath != null) {
                onImagePicked(imagePath);
              }
              Navigator.pop(context);
            },
          ),
          _buildIconColumn(
            context: context,
            icon: FontAwesomeIcons.image,
            label: 'Gallery',
            onTap: () async {
              String? imagePath = await ImagePickerUtil.pickImageFromGallery();
              if (imagePath != null) {
                onImagePicked(imagePath);
              }
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildIconColumn({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.subTitle),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: onTap,
              icon: FaIcon(icon, size: 30),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(label, style: const TextStyle(fontSize: 15)),
      ],
    );
  }
}
