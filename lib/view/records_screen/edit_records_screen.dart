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
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';


class EditRecordsScreen extends StatefulWidget {
  final int index; 

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
    dateController.text = data?.date ?? '';
    selectedRecordType = data?.reportType;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<UserRecordDb>('userRecordBox').listenable(),
      builder: (context, box, child) {
        var data =
            box.getAt(widget.index);
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
                    buildEditImagesection(newImagePath ?? data?.image),

                    const SizedBox(height: 18),
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
                        const SizedBox(height: 15),
                        CustomDate(
                          hintText: 'Select Report Date',
                          controller:
                              dateController,
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
                                    formattedDate; 
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 20),
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
                        _formKey.currentState!.save();
                        data!.image = newImagePath ??
                            data.image; 
                        data.recordName =
                            data.recordName; 
                        data.date = dateController.text; 
                        data.reportType =
                            selectedRecordType!; 
                        data.save();

                        CustomSnackbar.show(
                            context: context,
                            text: 'Your Record has been updated successfully!',
                            backgroundColor: Colors.green);

                        Navigator.pop(
                            context); 
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
