import 'dart:io';

import 'package:care_cloud/controller/edit_record_widget.dart';
import 'package:care_cloud/model/user_records_db/user_record_db.dart';
import 'package:care_cloud/utilities/colors.dart';
import 'package:care_cloud/utilities/customRadioButton_reportType.dart';
import 'package:care_cloud/utilities/customTextfornField.dart';
import 'package:care_cloud/utilities/custom_camera_gallery_bottom_sheet.dart';
import 'package:care_cloud/utilities/custom_date.dart';
import 'package:care_cloud/utilities/custom_snackbar.dart';
import 'package:care_cloud/utilities/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';


class EditRecordsScreen extends StatefulWidget {
  final int index; // The index of the record to be edited

  const EditRecordsScreen({super.key, required this.index});

  @override
  State<EditRecordsScreen> createState() => _EditRecordsScreenState();
}

class _EditRecordsScreenState extends State<EditRecordsScreen> {
  String? newImagePath;
  final _formKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  String? selectedRecordType;

  @override
  void initState() {
    super.initState();
    var data = Hive.box<UserRecordDb>('userRecordBox').getAt(widget.index);
    // Initialize controllers and selected values
    dateController.text = data?.date ?? '';
    selectedRecordType = data?.reportType;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<UserRecordDb>('userRecordBox').listenable(),
      builder: (context, box, child) {
        var data =
            box.getAt(widget.index); // Get the specific record based on index
        return Scaffold(
          backgroundColor: AppColors.secondary,
          appBar: AppBar(
            title: const Text('Edit Record'),
            backgroundColor: AppColors.secondary,
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Display image
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(10),
                    //   child: Container(
                    //     height: 320,
                    //     child: Image.file(
                    //       File(newImagePath ?? data!.image),
                    //       fit: BoxFit.fill,
                    //       width: double.infinity,
                    //     ),
                    //   ),
                    // ),
                    // buildImageSection(newImagePath?? data?.image),
                    buildEditImagesection(newImagePath ?? data?.image),

                    const SizedBox(height: 18),

                    // Button to change image
                    CustomButton(
                      text: 'Change Image',
                      icon: const Icon(
                        Icons.add_a_photo,
                        color: AppColors.secondary,
                      ),
                      width: 200,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return CustomCameraGalleryBottomSheet(
                                onImagePicked: (imagePath) {
                              setState(() {
                                newImagePath = imagePath;
                              });
                            });
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 15),

                    // Record Name Input
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Record name*'),
                        const SizedBox(height: 15),
                        CustomTextFormField(
                          initialValue: data?.recordName,
                          hintText: 'Eg. Blood test, scanning....',
                          width: 400,
                          borderRadius: 15,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a name for your record';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            data?.recordName = value!;
                          },
                        ),
                        const SizedBox(height: 15),

                        // Date Picker Input
                        const SizedBox(height: 15),
                        CustomDate(
                          hintText: 'Select Report Date',
                          controller:
                              dateController, // Use the controller directly
                          prefixIcon: FontAwesomeIcons.calendar,
                          iconButton: FontAwesomeIcons.circleChevronDown,
                          onPressed: () async {
                            final DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime.now(),
                            );

                            if (pickedDate != null) {
                              String formattedDate =
                                  DateFormat('dd MMM yyyy').format(pickedDate);
                              setState(() {
                                dateController.text =
                                    formattedDate; // Update controller
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 20),

                        // Report Type
                        const Text('Report type*'),
                        const SizedBox(height: 15),
                        CustomRadioButtonReportType(
                          groupValue: selectedRecordType,
                          onChanged: (value) {
                            setState(() {
                              selectedRecordType = value;
                            });
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    CustomButton(
                      text: 'Save Changes',
                      width: 400,
                      borderRadius: 10,
                      onTap: () {
                        _formKey.currentState!.save(); // Save the form

                        // Update the record
                        data!.image = newImagePath ??
                            data.image; // Use existing or new image
                        data.recordName =
                            data.recordName; // Use saved record name
                        data.date = dateController.text; // Update the date
                        data.reportType =
                            selectedRecordType!; // Update the report type
                        data.save(); // Save changes to Hive

                        CustomSnackbar.show(
                            context: context,
                            text: 'Your Record has been updated successfully!',
                            backgroundColor: Colors.green);

                        Navigator.pop(
                            context); // Go back to the previous screen
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
