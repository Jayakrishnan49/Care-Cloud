import 'dart:io';

import 'package:care_cloud/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';


class FullSizeImageView extends StatelessWidget {
  final String imagePath;
  const FullSizeImageView(
    {
      super.key,
      required this.imagePath
      }
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: PhotoView(imageProvider: FileImage(File(imagePath)),
          backgroundDecoration: const BoxDecoration(color:AppColors.title),
          ),
        ),
      ),
    );
  }
}