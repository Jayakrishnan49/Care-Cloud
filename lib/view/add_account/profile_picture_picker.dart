import 'dart:io';
import 'package:care_cloud/utilities/colors.dart';
import 'package:care_cloud/utilities/custom_camera_gallery_bottom_sheet.dart';
import 'package:flutter/material.dart';

class ProfilePicturePicker extends StatelessWidget {
  final String? image; 
  final Function(String imagePath) onImagePicked;

  const ProfilePicturePicker({
    super.key,
    required this.onImagePicked,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            height: 150,
            width: 150,
            color: AppColors.subTitle,
            child: image != null
                ? Image.file(File(image!), fit: BoxFit.fill)
                : const Center(
                    child: Icon(
                      Icons.person,
                      size: 130,
                    ),
                  ),
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
                  return CustomCameraGalleryBottomSheet(
                    onImagePicked: (imagePath) {
                      onImagePicked(imagePath);
                    },
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
