import 'package:care_cloud/model/vitals_db/vitals_db.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../utilities/colors.dart';


class VitalsViewSection extends StatelessWidget {
  final String selectedType;
  final ValueChanged<String> onTypeSelected;

  const VitalsViewSection({
    super.key,
    required this.selectedType,
    required this.onTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> titles = ['BP', 'Pulse', 'Temp', 'Weight', 'SPO2', 'Exercise'];
    final List<String> measurementTexts = ['mmHg', 'bpm', '°C', 'kg', '%', 'mins'];

    return Column(
      children: [
        // Horizontal list of titles (BP, Pulse, etc.)
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () => onTypeSelected(titles[index]),
                  child: Container(
                    width: 60,
                    height: 10,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primary),
                      borderRadius: BorderRadius.circular(9),
                      color: selectedType == titles[index]
                          ? AppColors.primary
                          : AppColors.secondary,
                    ),
                    child: Center(
                      child: Text(
                        titles[index],
                        style: TextStyle(
                          color: selectedType == titles[index]
                              ? AppColors.secondary
                              : AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        // Expanded section that displays the vitals data in a list
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: Hive.box<VitalsDb>('vitalsBox').listenable(),
            builder: (context, box, child) {
              if (box.isEmpty) {
                return const Center(child: Text('No vitals recorded'));
              }

              return ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  final vital = box.getAt(index) as VitalsDb;
                  String? displayData;
                  String? displayDataMeasurement;

                  // Determine which vital data to display based on the selected type
                  if (selectedType == 'BP' && vital.bp!.isNotEmpty) {
                    displayData = '${vital.bp}';
                    displayDataMeasurement = measurementTexts[0];
                  } else if (selectedType == 'Pulse' && vital.pulse!.isNotEmpty) {
                    displayData = '${vital.pulse}';
                    displayDataMeasurement = measurementTexts[1];
                  } else if (selectedType == 'Temp' && vital.temperature!.isNotEmpty) {
                    displayData = '${vital.temperature}';
                    displayDataMeasurement = measurementTexts[2];
                  } else if (selectedType == 'Weight' && vital.weight!.isNotEmpty) {
                    displayData = '${vital.weight}';
                    displayDataMeasurement = measurementTexts[3];
                  } else if (selectedType == 'SPO2' && vital.spo2!.isNotEmpty) {
                    displayData = '${vital.spo2}';
                    displayDataMeasurement = measurementTexts[4];
                  } else if (selectedType == 'Exercise' && vital.exercise!.isNotEmpty) {
                    displayData = '${vital.exercise}';
                    displayDataMeasurement = measurementTexts[5];
                  }

                  // Skip this item if no matching vital data is available
                  if (displayData == null) {
                    return Container();
                  }

                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Card(
                      elevation: 2,
                      color: Colors.white70,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${vital.date},  ${vital.time}',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  displayData,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: AppColors.primary,
                                  ),
                                ),
                                Text('$displayDataMeasurement')
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
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





















// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:project_1_carecloud/utilities/colors.dart';
// import 'package:project_1_carecloud/model/vitals_db/vitals_db.dart';

// class VitalsViewSection extends StatelessWidget {
//   final String selectedType;
//   final ValueChanged<String> onTypeSelected;

//   const VitalsViewSection({
//     Key? key,
//     required this.selectedType,
//     required this.onTypeSelected,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final List<String> titles = ['BP', 'Pulse', 'Temp', 'Weight', 'SPO2', 'Exercise'];

//     return Column(
//       children: [
//         SizedBox(
//           width: double.infinity,
//           height: 50,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: titles.length,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: InkWell(
//                   onTap: () => onTypeSelected(titles[index]),
//                   child: Container(
//                     width: 60,
//                     height: 10,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: AppColors.primary),
//                       borderRadius: BorderRadius.circular(9),
//                       color: selectedType == titles[index]
//                           ? AppColors.primary
//                           : AppColors.secondary,
//                     ),
//                     child: Center(
//                       child: Text(
//                         titles[index],
//                         style: TextStyle(
//                           color: selectedType == titles[index]
//                               ? AppColors.secondary
//                               : AppColors.primary,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//         Expanded(
//           child: ValueListenableBuilder(
//             valueListenable: Hive.box<VitalsDb>('vitalsBox').listenable(),
//             builder: (context, box, child) {
//               if (box.isEmpty) {
//                 return const Center(child: Text('No vitals recorded'));
//               }

//               return ListView.builder(
//                 itemCount: box.length,
//                 itemBuilder: (context, index) {
//                   final vital = box.getAt(index) as VitalsDb;
//                   // Handle displaying vitals as per `selectedType`.
//                 },
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
