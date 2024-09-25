import 'dart:io';

import 'package:care_cloud/utilities/customTextfornField.dart';
import 'package:flutter/material.dart';

Widget buildEditImagesection(String? imagePath){
 return ClipRRect(  
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 320,
                        child: Image.file(
                          File(imagePath!),
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                      ),
                    );
}


Widget buildEditRecordNameInput(TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Record name*'),
        const SizedBox(height: 15),
        CustomTextFormField(
          controller: controller,
          hintText: 'Eg. Blood test, scanning....',
          width: 400,
          borderRadius: 15,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a name for your record';
            }
            return null;
          },
        ),
      ],
    );
  }