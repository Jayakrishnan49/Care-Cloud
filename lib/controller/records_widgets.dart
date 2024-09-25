
import 'dart:io';
import 'package:care_cloud/utilities/customRadioButton_reportType.dart';
import 'package:care_cloud/utilities/customTextfornField.dart';
import 'package:care_cloud/utilities/custom_camera_gallery_bottom_sheet.dart';
import 'package:care_cloud/utilities/custom_date.dart';
import 'package:care_cloud/utilities/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';


class RecordsWidgets {
  bool showError = false;

  buildRecordNameInput(TextEditingController controller) {
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

  buildDatePicker(BuildContext context, TextEditingController dateController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDate(
          hintText: 'Report Date',
          prefixIcon: FontAwesomeIcons.calendar,
          iconButton: FontAwesomeIcons.circleChevronDown,
          controller: dateController,
          onPressed: () async {
            final DateTime? date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime.now(),
            );

            if (date != null) {
              String formattedDate = DateFormat('dd MMM yyyy').format(date);
              dateController.text = formattedDate;
            }
          },
        ),
      ],
    );
  }

  buildReportTypeSelector(String? selectedRecordType, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Report type*'),
        const SizedBox(height: 15),
        CustomRadioButtonReportType(
          groupValue: selectedRecordType,
          onChanged: (value) {
            onChanged(value);
            showError = false; // Reset error state when selecting
          },
        ),
        if (showError)
          const Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Text(
              'Please select a report type',
              style: TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }

   buildImageSection(String? imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 320,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: imagePath == null ? Colors.grey[300] : Colors.transparent,
        ),
        child: imagePath != null
            ? Image.file(
                File(imagePath),
                fit: BoxFit.fill,
                width: double.infinity,
              )
            : const Center(
                child: Text(
                  'No image added',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
      ),
    );
  }

  buildAddImageButton(BuildContext context, Function(String) onImagePicked, String? newImagePath) {
    return CustomButton(
      text: newImagePath == null ? 'Add Image' : 'Change Image',
      icon: const Icon(
        Icons.add_a_photo,
        color: Colors.white,
      ),
      width: 200,
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return CustomCameraGalleryBottomSheet(onImagePicked: (imagePath) {
              onImagePicked(imagePath);
            });
          },
        );
      },
    );
  }
}
