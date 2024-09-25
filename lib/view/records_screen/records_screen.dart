import 'package:care_cloud/controller/records_widgets.dart';
import 'package:care_cloud/controller/user_record_fn.dart';
import 'package:care_cloud/model/user_records_db/user_record_db.dart';
import 'package:care_cloud/utilities/colors.dart';
import 'package:care_cloud/utilities/custom_snackbar.dart';
import 'package:care_cloud/utilities/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
class RecordsScreen extends StatefulWidget {
  const RecordsScreen({super.key});

  @override
  State<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  late final Box<UserRecordDb> userRecordBox;
  TextEditingController dateController = TextEditingController();
  TextEditingController recordNameController = TextEditingController();
  final _formkey = GlobalKey<FormState>();  
  String? newImagePath;
  String? selectedRecordType;
  RecordsWidgets recordsWidgets = RecordsWidgets();

  @override
  void initState() {
    super.initState();
    userRecordBox = Hive.box<UserRecordDb>('userRecordBox');
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final UserRecordDetails _userRecordDetails = UserRecordDetails();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Record'),
        backgroundColor: AppColors.secondary,
      ),
      backgroundColor: AppColors.secondary,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                recordsWidgets.buildImageSection(newImagePath),
                const SizedBox(height: 18),
                recordsWidgets.buildAddImageButton(context, (imagePath) {
                  setState(() {
                    newImagePath = imagePath;
                  });
                }, newImagePath),
                const SizedBox(height: 15),
                recordsWidgets.buildRecordNameInput(recordNameController),
                const SizedBox(height: 15),
                recordsWidgets.buildDatePicker(context, dateController),
                const SizedBox(height: 20),
                recordsWidgets.buildReportTypeSelector(selectedRecordType, (value) {
                  setState(() {
                    selectedRecordType = value;
                  });
                }),
                const SizedBox(height: 15),
                
                 CustomButton(
      text: 'Upload Record',
      width: 400,
      borderRadius: 10,
      onTap: () {
        bool isImageSelected = newImagePath != null;

        if (_formkey.currentState!.validate() &&
            selectedRecordType != null &&
            isImageSelected &&
            dateController.text.isNotEmpty) {
          _userRecordDetails.addUserRecords(
            UserRecordDb(
              image: newImagePath!,
              recordName: recordNameController.text,
              date: dateController.text,
              reportType: selectedRecordType!,
            ),
          );

          setState(() {
            dateController.clear();
            recordNameController.clear();
            selectedRecordType = null;
            newImagePath = null;
          });
                        CustomSnackbar.show(
                  context: context, text: 'Your Report added successfully!', backgroundColor: Colors.green);
            }
            else {
              
              if (!isImageSelected) {
                CustomSnackbar.show(context: context, text: 'Please upload an image', backgroundColor: Colors.red);
              }
              if (selectedRecordType == null) {
                setState(() {
                          recordsWidgets.showError = true;
                        });
              }
              if (dateController.text.isEmpty) {
                CustomSnackbar.show(context: context, text: 'Please select a date', backgroundColor: Colors.red);
              }
            }
            }
            )
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
