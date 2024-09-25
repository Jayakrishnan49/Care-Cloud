import 'package:care_cloud/controller/doctor_appointment_fn.dart';
import 'package:care_cloud/model/doctor_appointment_db/doctor_appoitment_db.dart';
import 'package:care_cloud/utilities/colors.dart';
import 'package:care_cloud/utilities/customTextfornField.dart';
import 'package:care_cloud/utilities/custom_date_small.dart';
import 'package:care_cloud/utilities/custom_time_small.dart';
import 'package:care_cloud/utilities/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
// import 'package:project_1_carecloud/controller/doctor_appointment_fn.dart';
// import 'package:project_1_carecloud/model/doctor_appointment_db/doctor_appoitment_db.dart';
// import 'package:project_1_carecloud/utilities/colors.dart';
// import 'package:project_1_carecloud/utilities/customTextfornField.dart';
// import 'package:project_1_carecloud/utilities/custom_date_small.dart';
// import 'package:project_1_carecloud/utilities/custom_time_small.dart';
// import 'package:project_1_carecloud/utilities/custombutton.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  late final Box<DoctorAppoitmentDb> doctorAppointmentBox;
  @override
  void initState() {
    super.initState();
    doctorAppointmentBox = Hive.box<DoctorAppoitmentDb>('doctorAppointmentBox');
  }

  TextEditingController doctorNameController = TextEditingController();
  TextEditingController hospitalNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController doctorAddressController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final DoctorAppointmentDetails _doctorappointmentDetails =
        DoctorAppointmentDetails();
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        title: const Text('Appointments'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Doctor name*'),
                      const SizedBox(height: 15),
                      CustomTextFormField(
                        controller: doctorNameController,
                        hintText: 'Enter Doctor name',
                        width: 400,
                        borderRadius: 10,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the name of the doctor';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 25),
                      const Text('Hospital name/ Clinic name/ Lab...*'),
                      const SizedBox(height: 15),
                      CustomTextFormField(
                        controller: hospitalNameController,
                        hintText: 'Enter Hospital/Clinic name',
                        width: 400,
                        borderRadius: 10,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the name of the hospital/clinic';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomDateSmall(
                            hintText: 'Select Date',
                            prefixIcon: FontAwesomeIcons.calendar,
                            iconButton: FontAwesomeIcons.circleChevronDown,
                            controller: dateController,
                            onPressed: () async {
                              final DateTime? date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2050),
                              );

                              if (date != null) {
                                setState(() {
                                  dateController.text =
                                      DateFormat('dd MMM yyyy').format(date);
                                });
                              }
                            },
                          ),
                          CustomTimeSmall(
                            controller: timeController,
                            hintText: 'Select Time',
                            iconButton: FontAwesomeIcons.circleChevronDown,
                            onPressed: () async {
                              final TimeOfDay? time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (time != null) {
                                setState(() {
                                  timeController.text = time.format(context);
                                });
                              }
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      const Text('Address'),
                      const SizedBox(height: 15),
                      CustomTextFormField(
                        controller: doctorAddressController,
                        hintText: 'Enter address',
                        width: 400,
                        borderRadius: 10,
                        height: 150,
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
              CustomButton(
                text: 'Submit',
                width: 400,
                borderRadius: 10,
                onTap: () {
                  if (_formkey.currentState!.validate()) {
                    if (dateController.text.isEmpty ||
                        timeController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter both date and time.'),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.red,
                          margin: EdgeInsets.all(20),
                          duration: Duration(seconds: 3),
                          showCloseIcon: true,
                        ),
                      );
                      return;
                    }
                    _doctorappointmentDetails.addAppointments(
                        DoctorAppoitmentDb(
                            doctorName: doctorNameController.text,
                            hospitalName: hospitalNameController.text,
                            date: dateController.text,
                            time: timeController.text,
                            address: doctorAddressController.text));
                    setState(() {
                      doctorNameController.clear();
                      hospitalNameController.clear();
                      dateController.clear();
                      timeController.clear();
                      doctorAddressController.clear();
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Appointment added successfully'),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.green,
                        margin: EdgeInsets.all(20),
                        duration: Duration(seconds: 3),
                        showCloseIcon: true,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
