// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:care_cloud/controller/blood_glucose_fn.dart';
import 'package:care_cloud/model/blood_glucose_db/blood_glucose_db.dart';
import 'package:care_cloud/utilities/colors.dart';
import 'package:care_cloud/utilities/customRadioButton_foodIntake.dart';
import 'package:care_cloud/utilities/customTextfornField.dart';
import 'package:care_cloud/utilities/custom_date.dart';
import 'package:care_cloud/utilities/custom_snackbar.dart';
import 'package:care_cloud/utilities/custom_time.dart';
import 'package:care_cloud/utilities/custombutton.dart';
import 'package:care_cloud/view/blood_glucose_screen/blood_glucose_widget/custom_glucose_list.dart';
import 'package:care_cloud/view/blood_glucose_screen/blood_glucose_widget/tabbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
class BloodGlucoseScreen extends StatefulWidget {
  const BloodGlucoseScreen({super.key});

  @override
  State<BloodGlucoseScreen> createState() => _BloodGlucoseScreenState();
}

class _BloodGlucoseScreenState extends State<BloodGlucoseScreen> {
  late final Box<BloodGlucoseDb> bloodGlucoseBox;
  @override
  void initState() {
    super.initState();
    bloodGlucoseBox = Hive.box<BloodGlucoseDb>('bloodGlucoseBox');
  }

  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController bloodGlucoseController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  String? selectedFoodIntake;
  bool showError = false;

  @override
  Widget build(BuildContext context) {
    final BloodGlucoseDetails _bloodGlucoseDetails = BloodGlucoseDetails();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(
          backgroundColor: AppColors.secondary,
          title: const Text('Blood Glucose'),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(48.0), // Adjust height as needed
            child: BloodGlucoseTabBar(),
          ),
        ),
        body: TabBarView(children: [
          SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDate(
                      hintText: 'Select Date',
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
                          String formattedDate =
                              DateFormat('dd MMM yyyy').format(date);
                          setState(() {
                            dateController.text = formattedDate;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 25),
                    CustomTime(
                      controller: timeController,
                      prefixIcon: FontAwesomeIcons.clock,
                      hintText: 'Select Time',
                      iconButton: FontAwesomeIcons.circleChevronDown,
                      onPressed: () async {
                        final TimeOfDay? _time = await showTimePicker(
                            context: context, initialTime: TimeOfDay.now());
                        setState(() {
                          timeController.text = _time!.format(context);
                        });
                      },
                    ),
                    const SizedBox(height: 25),
                    const Text('Glucose Reading*'),
                    const SizedBox(height: 15),
                    CustomTextFormField(
                      controller: bloodGlucoseController,
                      hintText: 'Enter glucose reading',
                      keyboardType: TextInputType.number,
                      width: 400,
                      borderRadius: 15,
                      suffixText: 'mg/dL',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please ennter glucose reading';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 25),
                    const Text('Food Intake Timings* :'),
                    CustomradiobuttonFoodintake(
                      label: 'Fasting Blood Sugar',
                      groupValue: selectedFoodIntake,
                      onChanged: (value) {
                        setState(() {
                          selectedFoodIntake = value;
                          showError = false;
                        });
                      },
                    ),
                    CustomradiobuttonFoodintake(
                      label: 'Before Meal',
                      groupValue: selectedFoodIntake,
                      onChanged: (value) {
                        setState(() {
                          selectedFoodIntake = value;
                          showError = false;
                        });
                      },
                    ),
                    CustomradiobuttonFoodintake(
                      label: 'After Meal (2hrs)',
                      groupValue: selectedFoodIntake,
                      onChanged: (value) {
                        setState(() {
                          selectedFoodIntake = value;
                          showError = false;
                        });
                      },
                    ),
                    CustomradiobuttonFoodintake(
                      label: 'Random Blood Sugar',
                      groupValue: selectedFoodIntake,
                      onChanged: (value) {
                        setState(() {
                          selectedFoodIntake = value;
                          showError = false;
                        });
                      },
                    ),
                    if (showError == true)
                      const Text(
                        '*Please select an option from the list',
                        style: TextStyle(color: Colors.red),
                      ),
                    const SizedBox(height: 25),
                    CustomButton(
                      text: 'Add Values',
                      width: 400,
                      borderRadius: 10,
                      onTap: () {
                        if (_formkey.currentState!.validate() &&
                            selectedFoodIntake != null) {
                          if (dateController.text.isEmpty ||
                              timeController.text.isEmpty) {
                            CustomSnackbar.show(
                                context: context,
                                text: 'Please enter both date and time.',
                                backgroundColor: Colors.red);
                          } else {
                            _bloodGlucoseDetails.addBloodGlucose(
                              BloodGlucoseDb(
                                date: dateController.text,
                                time: timeController.text,
                                glucose: bloodGlucoseController.text,
                                foodIntakeTimings:
                                    selectedFoodIntake.toString(),
                              ),
                            );

                            setState(() {
                              dateController.clear();
                              timeController.clear();
                              bloodGlucoseController.clear();
                              selectedFoodIntake = null;
                            });
                            CustomSnackbar.show(context: context, text: 'Blood glucose value added successfully!', backgroundColor: Colors.green);
                          }
                        } else {
                          setState(() {
                            showError = selectedFoodIntake == null;
                          });
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          ValueListenableBuilder(
            valueListenable:
                Hive.box<BloodGlucoseDb>('bloodGlucoseBox').listenable(),
            builder: (context, box, child) {
              if (box.isEmpty) {
                return const Center(
                  child: Text('No blood glucose recorded'),
                );
              } else {
                return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final bloodGlucose = box.getAt(index) as BloodGlucoseDb;

                    return CustomBloodGlucoseCard(
                      text1: '${bloodGlucose.date}, ${bloodGlucose.time}',
                      text2: bloodGlucose.foodIntakeTimings,
                      text3: bloodGlucose.glucose,
                    );
                  },
                );
              }
            },
          )
        ]),
      ),
    );
  }
}
