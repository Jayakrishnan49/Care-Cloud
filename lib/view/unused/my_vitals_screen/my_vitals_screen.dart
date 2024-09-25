// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// // import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:intl/intl.dart';
// import 'package:project_1_carecloud/controller/vitals_fn.dart';
// import 'package:project_1_carecloud/model/vitals_db/vitals_db.dart';
// import 'package:project_1_carecloud/utilities/colors.dart';
// import 'package:project_1_carecloud/utilities/custom_date.dart';
// import 'package:project_1_carecloud/utilities/custom_time.dart';
// import 'package:project_1_carecloud/utilities/custom_vitals_field.dart';
// import 'package:project_1_carecloud/utilities/custombutton.dart';

// class MyVitals extends StatefulWidget {
//   const MyVitals({super.key});

//   @override
//   State<MyVitals> createState() => _MyVitalsState();
// }

// class _MyVitalsState extends State<MyVitals> {
//   late final Box<VitalsDb> vitalsBox;
//   String selectedType = 'BP';

//   @override
//   void initState() {
//     super.initState();
//     vitalsBox = Hive.box<VitalsDb>('vitalsBox');
//   }

//   @override
//   Widget build(BuildContext context) {
//     // ignore: no_leading_underscores_for_local_identifiers
//     final VitalsDetails _vitalsDetails = VitalsDetails();

//     TextEditingController timeController = TextEditingController();
//     TextEditingController dateController = TextEditingController();
//     TextEditingController bpController = TextEditingController();
//     TextEditingController pulseController = TextEditingController();
//     TextEditingController temperatureController = TextEditingController();
//     TextEditingController weightController = TextEditingController();
//     TextEditingController spo2Controller = TextEditingController();
//     TextEditingController exerciseController = TextEditingController();

//     // ignore: no_leading_underscores_for_local_identifiers
//     final _formkey = GlobalKey<FormState>();

//     final List<TextEditingController> controllers = [
//       bpController,
//       pulseController,
//       temperatureController,
//       weightController,
//       spo2Controller,
//       exerciseController,
//     ];

//     final List<IconData> icons = [
//       FontAwesomeIcons.wheelchair,
//       FontAwesomeIcons.heartPulse,
//       FontAwesomeIcons.temperatureThreeQuarters,
//       FontAwesomeIcons.weightScale,
//       FontAwesomeIcons.droplet,
//       FontAwesomeIcons.dumbbell
//     ];

//     final List<String> titles = [
//       'BP',
//       'Pulse',
//       'Temp',
//       'Weight',
//       'SPO2',
//       'Exercise'
//     ];

//     final List<String> measurementTexts = [
//       'mmHG',
//       'bpm',
//       '°C',
//       'kg',
//       '%',
//       'mins'
//     ];

//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         backgroundColor: AppColors.secondary,
//         appBar: AppBar(
//           backgroundColor: AppColors.secondary,
//           title: const Text('Vitals', style: TextStyle(color: AppColors.title)),
//           bottom: const TabBar(
//             dividerHeight: 0,
//             indicatorSize: TabBarIndicatorSize.label,
//             labelColor: AppColors.primary,
//             indicatorColor: AppColors.primary,
//             labelStyle: TextStyle(fontSize: 18), 
//             unselectedLabelColor: AppColors.title,
//             tabs: [
//               Tab(text: 'Add Vitals'),
//               Tab(text: 'View'),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             SingleChildScrollView(
//               child: Form(
//                 key: _formkey,
//                 child: Padding(
//                   padding: const EdgeInsets.all(18.0),
//                   child: Column(
//                     children: [
//                       CustomDate(
//                           hintText: 'Select Date',
//                           prefixIcon: FontAwesomeIcons.calendar,
//                           iconButton: FontAwesomeIcons.circleChevronDown,
//                           controller: dateController,
//                           onPressed: () async {
//                             final DateTime? date = await showDatePicker(
//                               context: context,
//                               initialDate: DateTime.now(),
//                               firstDate: DateTime(2000),
//                               lastDate: DateTime.now(),
//                             );

//                             if (date != null) {
//                               String formattedDate =
//                                   DateFormat('dd MMM yyyy').format(date);
//                               setState(() async {
//                                 dateController.text = formattedDate;
//                               });
//                             }
//                           }),
//                       const SizedBox(
//                         height: 25,
//                       ),

//                       CustomTime(
//                         controller: timeController,
//                         prefixIcon: FontAwesomeIcons.clock,
//                         hintText: 'Select Time',
//                         iconButton: FontAwesomeIcons.circleChevronDown,
//                         onPressed: () async {
//                           // ignore: no_leading_underscores_for_local_identifiers
//                           final TimeOfDay? _time = await showTimePicker(
//                               context: context, initialTime: TimeOfDay.now());
//                           setState(() async {
//                             timeController.text = _time!.format(context);
//                           });
//                         },
//                       ),

//                       /////////////////////////////
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       GridView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 2,
//                                 crossAxisSpacing: 20,
//                                 mainAxisSpacing: 20,
//                                 childAspectRatio: 1.1),
//                         itemCount: icons.length,
//                         itemBuilder: (context, index) {
//                           return CustomVitalsField(
//                             controller: controllers[index],
//                             faIcon: icons[index],
//                             title: titles[index],
//                             measurementText: measurementTexts[index],
//                           );
//                         },
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       CustomButton(
//                         text: 'Save',
//                         width: 400,
//                         borderRadius: 10,
//                         onTap: () {
//                           if (_formkey.currentState!.validate()) {
//                             if (dateController.text.isEmpty ||
//                                 timeController.text.isEmpty) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content:
//                                       Text('Please enter both date and time.'),
//                                   behavior: SnackBarBehavior.floating,
//                                   backgroundColor: Colors.red,
//                                   margin: EdgeInsets.all(20),
//                                   duration: Duration(seconds: 3),
//                                   showCloseIcon: true,
//                                 ),
//                               );
//                               return;
//                             }
//                             _vitalsDetails.addVitals(VitalsDb(
//                               date: dateController.text,
//                               time: timeController.text,
//                               bp: bpController.text,
//                               pulse: pulseController.text,
//                               temperature: temperatureController.text,
//                               weight: weightController.text,
//                               spo2: spo2Controller.text,
//                               exercise: exerciseController.text,
//                             ));
//                             setState(() {
//                               dateController.clear();
//                               timeController.clear();
//                               for (var controller in controllers) {
//                                 controller.clear();
//                               }
//                             });
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text('Vitals updated successfully'),
//                                 behavior: SnackBarBehavior.floating,
//                                 backgroundColor: Colors.green,
//                                 margin: EdgeInsets.all(20),
//                                 duration: Duration(seconds: 3),
//                                 showCloseIcon: true,
//                               ),
//                             );
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(children: [
//                 SizedBox(
//                   width: double.infinity,
//                   height: 50,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: titles.length,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: InkWell(
//                           onTap: () {
//                             setState(() {
//                               selectedType = titles[index];
//                             });
//                           },
//                           child: Container(
//                             width: 60,
//                             height: 10,
//                             decoration: BoxDecoration(
//                                 border: Border.all(color: AppColors.primary),
//                                 borderRadius:
//                                     const BorderRadius.all(Radius.circular(9)),
//                                 color: selectedType == titles[index]
//                                     ? AppColors.primary
//                                     : AppColors.secondary),
//                             child: Center(
//                               child: Text(
//                                 titles[index],
//                                 style: TextStyle(
//                                   color: selectedType == titles[index]
//                                       ? AppColors.secondary
//                                       : AppColors.primary,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Expanded(
//                     child: ValueListenableBuilder(
//                         valueListenable:
//                             Hive.box<VitalsDb>('vitalsBox').listenable(),
//                         builder: (context, box, child) {
//                           if (box.isEmpty) {
//                             return const Center(
//                                 child: Text('No vitals recorded'));
//                           }
//                           return ListView.builder(
//                               itemCount: vitalsBox.length,
//                               itemBuilder: (context, index) {
//                                 final vital =
//                                     vitalsBox.getAt(index) as VitalsDb;
//                                 String? displayData;
//                                 String? displayDataMeasurement;
//                                 if (selectedType == 'BP' &&
//                                     (vital.bp ?? '').isNotEmpty) {
//                                   displayData = '${vital.bp}';
//                                   displayDataMeasurement = measurementTexts[0];
//                                 } else if (selectedType == 'Pulse' &&
//                                     (vital.pulse ?? '').isNotEmpty) {
//                                   displayData = '${vital.pulse}';
//                                   displayDataMeasurement = measurementTexts[1];
//                                 } else if (selectedType == 'Temp' &&
//                                     (vital.temperature ?? '').isNotEmpty) {
//                                   displayData = '${vital.temperature}';
//                                   displayDataMeasurement = measurementTexts[2];
//                                 } else if (selectedType == 'Weight' &&
//                                     (vital.weight ?? '').isNotEmpty) {
//                                   displayData = '${vital.weight}';
//                                   displayDataMeasurement = measurementTexts[3];
//                                 } else if (selectedType == 'SPO2' &&
//                                     (vital.spo2 ?? '').isNotEmpty) {
//                                   displayData = '${vital.spo2}';
//                                   displayDataMeasurement = measurementTexts[4];
//                                 } else if (selectedType == 'Exercise' &&
//                                     (vital.exercise ?? '').isNotEmpty) {
//                                   displayData = '${vital.exercise}';
//                                   displayDataMeasurement = measurementTexts[5];
//                                 }

//                                 if (displayData == null) {
//                                   return Container();
//                                 }
//                                 return Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 10, right: 10, bottom: 10),
//                                   child: Card(
//                                     elevation: 2,
//                                     color: Colors.white70,
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(20 - .0),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Text(
//                                                 '${vital.date},  ${vital.time}',
//                                                 style: const TextStyle(
//                                                   fontSize: 16,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           Column(
//                                             children: [
//                                               Text(
//                                                 displayData,
//                                                 style: const TextStyle(
//                                                     fontSize: 18,
//                                                     color: AppColors.primary),
//                                               ),
//                                               Text('$displayDataMeasurement')
//                                             ],
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               });
//                         }))
//               ]),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
