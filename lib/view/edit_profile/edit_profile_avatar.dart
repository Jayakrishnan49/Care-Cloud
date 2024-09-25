import 'dart:io';

import 'package:care_cloud/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class EditProfileAvatar extends StatelessWidget {
  final String? imagePath;
  final VoidCallback onCameraTap;
  final VoidCallback onGalleryTap;

  const EditProfileAvatar({
    super.key,
    required this.imagePath,
    required this.onCameraTap,
    required this.onGalleryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 170.0,
          height: 170.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.primary,
              width: 3.0,
            ),
          ),
          child: CircleAvatar(
            foregroundColor: AppColors.primary,
            radius: 200,
            backgroundImage: FileImage(File(imagePath!)),
          ),
        ),
        Positioned(
          bottom: 5,
          right: 5,
          child: InkWell(
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.camera_alt_outlined,
                size: 30,
                color: AppColors.secondary,
              ),
            ),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                 return SizedBox(
                  height: 180,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
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
              onPressed:(){
                onCameraTap();
                Navigator.pop(context);
              } ,
              icon: const FaIcon(FontAwesomeIcons.camera, size: 30),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text('Camera', style: TextStyle(fontSize: 15)),
      ],
    ),
     Column(
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
              onPressed:(){
                onGalleryTap();
                Navigator.pop(context);
              }, 
              icon: const FaIcon(FontAwesomeIcons.image, size: 30),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text('Gallery', style: TextStyle(fontSize: 15)),
      ],
    )
                    ],
                  ),
                 );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
